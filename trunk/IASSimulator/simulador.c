#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>
#include <math.h>

#define TAMMEMORIA 4096
#define TAMLINHA 12
#define NUMEROMAX 549755813887

/*==============================================================================
 *Definição da Arquitetura
 */
typedef struct {
    unsigned int instrucaoEsquerdaRequirida : 1;
    unsigned int erro : 1;
    unsigned int proximaIBR : 1;
} tCircuitoControle;

typedef struct {
    unsigned long int AC : 40;
    unsigned long int MQ : 40;
    unsigned long int MBR : 40;
} tULA;

typedef struct {
    unsigned long int IR : 8;
    unsigned long int IBR : 20;
    int MAR : 12;
    int PC : 12;
    tCircuitoControle CIRCUITOCONTROLE;
} tUC;

typedef struct {
    long int linha : 40;
} tlinha;

/*==============================================================================
 *Declaração da Arquitetura
 */
tlinha memoria[4096];
tULA ula;
tUC uc;

/*==============================================================================
 *Funções Auxiliares
 */
long int hexToDec(char * hexadecimal) {
    int i;
    int numero;
    long int decimal = 0;
    long int expoente = 1;
    for (i = strlen(hexadecimal) - 1; i >= 0; i--) {
        switch (hexadecimal[i]) {
            case 10: //quando tem um \n
                continue;
            case '0' ... '9':
                numero = hexadecimal[i] - 48;
                break;
            case 'A':
                numero = 10;
                break;
            case 'B':
                numero = 11;
                break;
            case 'C':
                numero = 12;
                break;
            case 'D':
                numero = 13;
                break;
            case 'E':
                numero = 14;
                break;
            case 'F':
                numero = 15;
                break;
        }
        decimal += numero*expoente;
        expoente *= 16;
    }
    return decimal;
}

void imprimeMemoria() {
    int i = 0;
    while (i < 130) {
        printf("%d - %lX\n", i, memoria[i].linha);
        i++;
    }
}

long int mask(long int valor, long int mascara, int deslocamento) {
    return (valor & mascara) >> (deslocamento * 4);
}

/*==============================================================================
 * Gerenciamento de Memória
 */

long int load(int index) {
    if (index < TAMMEMORIA) {
        return memoria[index].linha;
    } else {
        uc.CIRCUITOCONTROLE.erro = 1;
        return NULL;
    }
}

void stor(int index, long int value) {
    if (index < TAMMEMORIA) {
        memoria[index].linha = value;
    } else {
        uc.CIRCUITOCONTROLE.erro = 1;
    }
}

void storEndereco(int index, long int value, int esquerda) {
    if (index < TAMMEMORIA) {
        if (esquerda){
            value = value<<20;
            memoria[index].linha = (memoria[index].linha & 0xFF000FFFFF) + value;
        } else {
            memoria[index].linha = (memoria[index].linha & 0xFFFFFFF000) + value;
        }
    } else {
        uc.CIRCUITOCONTROLE.erro = 1;
    }
}

void carregaMemoria(char * arquivo) {
    FILE * hex;

    //receber nome do arquivo por parametro
    hex = fopen(arquivo, "r");

    if (hex == NULL) {
        printf("Falha ao abrir o arquivo .hex\n");
    }
    int i = 0;
    char * linha = malloc(TAMLINHA);
    long int numero;
    do {
        fgets(linha, TAMLINHA, hex);
        numero = hexToDec(linha);
        stor(i++,numero);
    } while (!feof(hex));
}

/*==============================================================================
 *Unidade Lógica e Aritmética
 */
void circuitoLogicoAritmetico(int opcode, unsigned long int mbr,
                unsigned long int * ac, unsigned long int * mq) {
    switch (opcode) {
        case 0x5: //add m(x)
            *ac += mbr;
            break;
        case 0x6: //sub m(x)
            *ac -= mbr;
            break;
        case 0x7: //add |m(x)|
            *ac += labs(mbr);
            break;
        case 0x8: //sub |m(x)|
            *ac -= labs(mbr);
            break;
        case 0xB: //mul m(x)
            if ((mbr * *mq) > NUMEROMAX) {
                *ac = (mbr * *mq) - NUMEROMAX;
                *mq *= mbr;
            } else {
                *mq *= mbr;
            }
            break;
        case 0xC: //div m(x)
            *mq = *ac / mbr;
            *ac %= mbr;
            break;
        case 0x14: //lsh
            *ac <<= 1;
            break;
        case 0x15: //rsh
            *ac >>= 1;
            break;
    }
}


/*==============================================================================
 *Unidade de Controle
 */
void init() {
    int i;
    for (i = 0; i < TAMMEMORIA; i++) {
        stor(i,0);
    }
    ula.AC = 0;
    ula.MBR = 0;
    ula.MQ = 0;
    uc.PC = 0;
    uc.MAR = 0;
    uc.IR = 0;
    uc.IBR = 0;
    uc.CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 1;
    uc.CIRCUITOCONTROLE.erro = 0;
    uc.CIRCUITOCONTROLE.proximaIBR = 0;
}

void busca(unsigned long int * ir, unsigned long int * ibr, unsigned long int * mbr ,
        unsigned int * mar, unsigned int * pc, unsigned int * proximaIbr,
        unsigned int * instrucaoEsquerdaRequerida) {
    if (*instrucaoEsquerdaRequerida) {
        if (*proximaIbr) {
            *ir = mask(*ibr, 0xFF000, 3);
            *mar = mask(*ibr, 0x00FFF, 0);
            *pc++;
            *proximaIbr = 0;
        } else {
            *mar = *pc;
            *mbr = load(*mar);
            *ir = mask(*mbr, 0xFF00000000, 8);
            *ibr = mask(*mbr, 0x00000FFFFF, 0);
            *mar = mask(*mbr, 0x00FFF00000, 5);
            *proximaIbr = 1;
        }
    } else {
        *mar = *pc;
        *mbr = load(*mar);
        *ir = mask(*mbr, 0x00000FF000, 3);
        *mar = mask(*mbr, 0x0000000FFF, 0);
        *proximaIbr = 0;
        *instrucaoEsquerdaRequerida = 1;
        *pc++;
    }
}

void buscaOperandos(int mar, unsigned long int * mbr) {
    *mbr = load(mar);
}

void decodificaExecuta(int mar, unsigned long int ir, unsigned long int * mbr,
        unsigned long int * ac, unsigned long int * mq, unsigned int * pc,
        unsigned int * instrucaoEsquerdaRequerida) {
    switch (ir) {
        case 0xA: //load mq
            *ac = *mq;
            break;
        case 0x9: //load mq,m(x)
            buscaOperandos(mar,mbr);
            *mq = *mbr;
            break;
        case 0x21: //stor m(x)
            stor(mar,*ac);
            break;
        case 0x1: //load m(x)
            buscaOperandos(mar,mbr);
            *ac = *mbr;
            break;
        case 0x2: //load -m(x)
            buscaOperandos(mar,mbr);
            *ac = *mbr;
            *ac ^= 0x8000000000;
            break;
        case 0x3: //load |m(x)|
            buscaOperandos(mar,mbr);
            *ac = *mbr;
            *ac &= 0x7FFFFFFFFF;
            break;
        case 0x4: //load -|m(x)|
            buscaOperandos(mar,mbr);
            *ac = *mbr;
            *ac &= 0x7FFFFFFFFF;
            *ac ^= 0x8000000000;
            break;
        case 0xD: //jump m(x,0:19)
            buscaOperandos(mar,mbr);
            *pc = *mbr;
            break;
        case 0xE: //jump m(x,20:39)
            buscaOperandos(mar,mbr);
            *pc = *mbr;
            *instrucaoEsquerdaRequerida = 0;
            break;
        case 0xF: //jump+ m(x,0:19)
            if (*ac < 0){
                buscaOperandos(mar,mbr);
                *pc = *mbr;
            }
            break;
        case 0x10: //jump + m(x,20:39)
            if (*ac < 0){
                buscaOperandos(mar,mbr);
                *pc = *mbr;
                *instrucaoEsquerdaRequerida = 0;
            }
            break;
        case 0x5: //add m(x)
            buscaOperandos(mar,mbr);
            circuitoLogicoAritmetico(ir,*mbr,ac,mq);
            break;
        case 0x6: //sub m(x)
            buscaOperandos(mar,mbr);
            circuitoLogicoAritmetico(ir,*mbr,ac,mq);
            break;
        case 0x7: //add |m(x)|
            buscaOperandos(mar,mbr);
            circuitoLogicoAritmetico(ir,*mbr,ac,mq);
            break;
        case 0x8: //sub |m(x)|
            buscaOperandos(mar,mbr);
            circuitoLogicoAritmetico(ir,*mbr,ac,mq);
            break;
        case 0xB: //mul m(x)
            buscaOperandos(mar,mbr);
            circuitoLogicoAritmetico(ir,*mbr,ac,mq);
            break;
        case 0xC: //div m(x)
            buscaOperandos(mar,mbr);
            circuitoLogicoAritmetico(ir,*mbr,ac,mq);
            break;
        case 0x14: //lsh
            buscaOperandos(mar,mbr);
            circuitoLogicoAritmetico(ir,*mbr,ac,mq);
            break;
        case 0x15: //rsh
            buscaOperandos(mar,mbr);
            circuitoLogicoAritmetico(ir,*mbr,ac,mq);
            break;
        case 0x12: //stor m(x,8:19)
            buscaOperandos(mar,mbr);
            storEndereco(*mbr,*ac,1);
            break;
        case 0x13: //stor m(x,28:39)
            buscaOperandos(mar,mbr);
            storEndereco(*mbr,*ac,0);
            break;
        case 0x0: //exit
            *pc = -1;
    }
}
/*==============================================================================
 *Programa Principal
 */
int main(int argc, char** argv) {
    init();
    carregaMemoria("teste2.hex");
    do{
        busca(&uc.IR,&uc.IBR,&ula.MBR,&uc.MAR,&uc.PC,&uc.CIRCUITOCONTROLE.proximaIBR,&uc.CIRCUITOCONTROLE.instrucaoEsquerdaRequirida);
        decodificaExecuta(uc.MAR,uc.IR,&ula.MBR,&ula.AC,&ula.MQ,&uc.PC,&uc.CIRCUITOCONTROLE.instrucaoEsquerdaRequirida);
    } while (uc.PC != -1 || uc.CIRCUITOCONTROLE.erro != 1);
    imprimeMemoria();
    return (0);
}