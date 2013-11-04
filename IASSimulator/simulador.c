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
void decToHex(int dec, char * hex) {
    int resto = 0;
    int i;
    for (i = 0; i <= 10; i++){
        hex[i] = '0';
    }
    i = 10;
    while ((dec > 0) && (i >= 0)) {
        printf("dec: %d\n", dec);
        resto = dec % 16;
        dec = dec / 16;
        printf("resto: %d\n", resto);        
        hex[i] = getHexValue(resto);
        printf("char: %c\n", hex[i]);
        i--;
    }
}

long int inverte(long int valor) {
    return valor * (-1);
}

void modulo(long int valor) {
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

void imprimeMemoria() {
    int i = 0;
    while ((strlen(memoria[i]) != 0) && (i < TAMMEMORIA)) {
        printf("linha: %d - %s", i, memoria[i]);
        i++;
    }
}

void busca(int esquedaRequerida) {
    if (esquedaRequerida) {
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
    if (strcmp(IR, "0A")) { //LOAD MQ
        AC = MQ;
    } else if (strcmp(IR, "09")) { //LOAD MQ,M(X)
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
    } else if (strcmp(IR, "21")) { //STOR M(X)
        //TODO converter de decimal para Hexa
        strcpy(memoria[MAR], MBR);
    } else if (strcmp(IR, "01")) { //LOAD M(X)
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
    } else if (strcmp(IR, "02")) { //LOAD -M(X)
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
        AC = inverte(AC);
    } else if (strcmp(IR, "03")) { //LOAD |M(X)|
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
        AC = modulo(AC);
    } else if (strcmp(IR, "04")) { //LOAD -|(X)|
        strcpy(MBR, memoria[MAR]);
        AC = hexToDec(MBR);
        AC = modulo(AC);
        AC = inverte(AC);
    } else if (strcmp(IR, "0D")) { //JUMP M(X,0:19)
        PC = MAR;
    } else if (strcmp(IR, "0E")) { //JUMP M(X,20:39)
        PC = MAR;
        CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 0;
    } else if (strcmp(IR, "0F")) { //JUMP+ M(X,0:19)
        if (isPositivo(AC)) {
            PC = MAR;
        }
    } else if (strcmp(IR, "10")) { //JUMP+ M(X,20:39)
        if (isPositivo(AC)) {
            PC = MAR;
            CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 0;
        }
    } else if (strcmp(IR, "05")) { //ADD M(X)
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        AC += mbr;
    } else if (strcmp(IR, "07")) { //ADD |M(X)|
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        mbr = modulo(mbr);
        AC += mbr;
    } else if (strcmp(IR, "06")) { //SUB M(X)
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        AC -= mbr;
    } else if (strcmp(IR, "08")) { //SUB |M(X)|
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        mbr = modulo(mbr);
        AC -= mbr;
    } else if (strcmp(IR, "0B")) { //MUL M(X)
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        MQ = MQ * mbr;
        if (MQ > NUMEROMAX)
              AC = MQ - NUMEROMAX;
        else
              AC = 0;
    } else if (strcmp(IR, "0C")) { //DIV M(X)
        strcpy(MBR, memoria[MAR]);
        long int mbr = hexToDec(MBR);
        MQ = AC / mbr;
        AC = AC % mbr;
    } else if (strcmp(IR, "14")) { //LSH
        AC = AC<<1;
    } else if (strcmp(IR, "15")) { //RSH
        AC = AC>>1;
    } else if (strcmp(IR, "12")) { //STOR M(X,8:19)
        strcpy(MBR, memoria[MAR]);
    } else if (strcmp(IR, "13")) { //STOR M(X,28:39)
        strcpy(MBR, memoria[MAR]);
    } else { //EXIT
        PC = -1;
    }
}



int main(int argc, char** argv) {
    inicializaRegistradores();
    carregaMemoria("teste2.hex");
    //do{
    //    PC = 0;
    //    busca();
    //    busca();
    //    busca();
    //    busca();   
    //} while (PC != -1);
    //busca();
    //decodifica();
    //buscaoperando();
    //executa();
    //escritaResultado();
    
    int teste = 100;
    int i = 0;
    decToHex(teste, AC);
    for(i = 0; i <= 10; i++){
        printf("%c", AC[i]);
    }

    return (EXIT_SUCCESS);
}

