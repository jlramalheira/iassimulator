#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

#define TAMMEMORIA 4096
#define TAMLINHA 12
#define NUMEROMAX 549755813888

typedef struct {
    int instrucaoEsquerdaRequirida;
} tCircuitoControle;
//Registradores
//ULA
long int AC;
long int MQ;
char * MBR;
//UC
char * IBR;
char * IR;
int PC;
int MAR;
tCircuitoControle CIRCUITOCONTROLE;

//FUNÇÕES AUXILIARES

long int hexToDec(char * hexadecimal) {
    int i;
    int numero;
    long int decimal = 0;
    int expoente = 1;
    for (i = strlen(hexadecimal) - 1; i >= 0; i--) {
        if (hexadecimal[i] == 'A') {
            numero = 10;
        } else if (hexadecimal[i] == 'B') {
            numero = 11;
        } else if (hexadecimal[i] == 'C') {
            numero = 12;
        } else if (hexadecimal[i] == 'D') {
            numero = 13;
        } else if (hexadecimal[i] == 'E') {
            numero = 14;
        } else if (hexadecimal[i] == 'F') {
            numero = 15;
        } else {
            numero = hexadecimal[i] - 48;
        }
        decimal += numero*expoente;
        expoente *= 16;
    }
    return decimal;
}

/*
 * Retorna o valor de um inteiro em um caracter hexa
 */
char getHexValue(int value) {
    if (value < 0) return -1;
    if (value > 16) return -1;
    if (value <= 9) {
        value += '0';
        return (char) value;
    } else {
        value -= 10;
        return (char) ('A' + value);
    }
}

/*
 * Converte um decimal para inteiro
 */
void decToHex(long int dec, char * hex, int tamanho) {
    int negativo = 0;
    if (dec < 0) {
        negativo = 1;
        dec *= -1;
    }
    int i;
    int resto;
    for (i = tamanho - 1; i >= 0; i--) {
        resto = dec % 16;
        if (!i && negativo) {
            resto += 8;
        }
        switch (resto) {
            case 0 ... 9:
                hex[i] = resto + '0';
                break;
            case 10:
                hex[i] = 'A';
                break;
            case 11:
                hex[i] = 'B';
                break;
            case 12:
                hex[i] = 'C';
                break;
            case 13:
                hex[i] = 'D';
                break;
            case 14:
                hex[i] = 'E';
                break;
            case 15:
                hex[i] = 'F';
                break;
        }
        dec = dec / 16;
    }
}

long int inverte(long int valor) {
    return valor * (-1);
}

long int modulo(long int valor) {
    if (valor < 0) {
        return inverte(valor);
    }
    return valor;
}

int isPositivo(long int valor) {
    if (valor > 0) {
        return 1;
    }
    return 0;
}

//Memoria
char memoria[TAMMEMORIA][TAMLINHA];

void inicializaRegistradores() {
    AC = 0;
    MQ = 0;
    MBR = malloc(10);

    IBR = malloc(5);
    IR = malloc(2);
    PC = 0;
    MAR = 0;
    CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 1;
}

void carregaMemoria(char * arquivo) {
    FILE * hex;

    //receber nome do arquivo por parametro
    hex = fopen(arquivo, "r");

    if (hex == NULL) {
        printf("Falha ao abrir o arquivo .hex\n");
    }
    int i = 0;
    do {
        fgets(memoria[i++], TAMLINHA, hex);
    } while (!feof(hex));
}
void imprimeRegistradores(){
    printf("AC: %d\n",AC);
    printf("MQ: %d\n",MQ);
    printf("MBR: %s\n",MBR);
    printf("IBR: %s\n",IBR);
    printf("IR: %s\n",IR);
    printf("PC: %d\n",PC);
    printf("MAR: %d\n\n",MAR);
}

void imprimeMemoria() {
    int i = 0;
//    while ((strlen(memoria[i]) != 0) && (i < TAMMEMORIA)) {
//        printf("linha: %d - %s", i, memoria[i]);
//        i++;
//    }
    for (i = 74; i < 90; i++){
        printf("linha: %d - %s", i, memoria[i]);
    }
}

void busca() {
    if (CIRCUITOCONTROLE.instrucaoEsquerdaRequirida) {
        //verifica se tem instrução em IBR
        if (strlen(IBR) == 0) {
            MAR = PC;
            MBR = memoria[MAR];
            int i;
            for (i = 0; i < 2; i++) {
                IR[i] = MBR[i];
            }
            int j = 0;
            for (i = 5; i < 10; i++) {
                IBR[j++] = MBR[i];
            }
            j = 0;
            char aux[3];
            for (i = 2; i < 5; i++) {
                aux[j++] = MBR[i];
            }
            MAR = atoi(aux);
        } else {
            int i;
            for (i = 0; i < 2; i++) {
                IR[i] = IBR[i];
            }
            int j = 0;
            char aux[3];
            for (i = 2; i < 5; i++) {
                aux[j++] = IBR[i];
            }
            MAR = atoi(aux);
            IBR[0] = '\0';
            PC++;
        }
    } else {
        MAR = PC;
        int j = 0;
        int i;
        for (i = 5; i < 7; i++) {
            IR[j++] = MBR[i];
        }
        j = 0;
        char aux[3];
        for (i = 7; i < 10; i++) {
            aux[j++] = MBR[i];
        }
        MAR = atoi(aux);
        IBR[0] = '\0';
        PC++;
        CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 1;
    }
}

void execucao() {
    if (strcmp(IR, "0A") == 0) { //LOAD MQ
        AC = MQ;
    } else if (strcmp(IR, "09") == 0) { //LOAD MQ,M(X)
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
    } else if (strcmp(IR, "21") == 0) { //STOR M(X)
        decToHex(AC, MBR, 10);
        strcpy(memoria[MAR], MBR);
    } else if (strcmp(IR, "01") == 0) { //LOAD M(X)
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
    } else if (strcmp(IR, "02") == 0) { //LOAD -M(X)
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
        AC = inverte(AC);
    } else if (strcmp(IR, "03") == 0) { //LOAD |M(X)|
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
        AC = modulo(AC);
    } else if (strcmp(IR, "04") == 0) { //LOAD -|(X)|
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
        AC = modulo(AC);
        AC = inverte(AC);
    } else if (strcmp(IR, "0D") == 0) { //JUMP M(X,0:19)
        PC = MAR;
    } else if (strcmp(IR, "0E") == 0) { //JUMP M(X,20:39)
        PC = MAR;
        CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 0;
    } else if (strcmp(IR, "0F") == 0) { //JUMP+ M(X,0:19)
        if (isPositivo(AC)) {
            PC = MAR;
        }
    } else if (strcmp(IR, "10") == 0) { //JUMP+ M(X,20:39)
        if (isPositivo(AC)) {
            PC = MAR;
            CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 0;
        }
    } else if (strcmp(IR, "05") == 0) { //ADD M(X)
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        AC += mbr;
    } else if (strcmp(IR, "07") == 0) { //ADD |M(X)|
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        mbr = modulo(mbr);
        AC += mbr;
    } else if (strcmp(IR, "06") == 0) { //SUB M(X)
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        AC -= mbr;
    } else if (strcmp(IR, "08") == 0) { //SUB |M(X)|
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        mbr = modulo(mbr);
        AC -= mbr;
    } else if (strcmp(IR, "0B") == 0) { //MUL M(X)
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        MQ = MQ * mbr;
        if (MQ > NUMEROMAX)
            AC = MQ - NUMEROMAX;
        else
            AC = 0;
    } else if (strcmp(IR, "0C") == 0) { //DIV M(X)
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        MQ = AC / mbr;
        AC = AC % mbr;
    } else if (strcmp(IR, "14") == 0) { //LSH
        AC = AC << 1;
    } else if (strcmp(IR, "15") == 0) { //RSH
        AC = AC >> 1;strcpy(MBR, memoria[MAR]);
    } else if (strcmp(IR, "12") == 0) { //STOR M(X,8:19)
        decToHex(AC, MBR, 3);
        int i;
        for (i = 2; i < 5; i++) {
            memoria[MAR][i] = MBR[i-2];
        }
    } else if (strcmp(IR, "13") == 0) { //STOR M(X,28:39)
        decToHex(AC, MBR, 3);
        int i;
        for (i = 7; i < 10; i++) {
            memoria[MAR][i] = MBR[i-7];
        }
    } else{ //EXIT
        PC = -1;
    }
}

int main(int argc, char** argv) {
    inicializaRegistradores();
    carregaMemoria("teste2.hex");
    PC = 0;
    do{
        busca();
        execucao();
    } while (PC != -1);
    imprimeMemoria();
    return (EXIT_SUCCESS);
}

