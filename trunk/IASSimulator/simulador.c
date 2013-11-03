#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

#define TAMMEMORIA 4096
#define TAMLINHA 12

typedef struct {
    int instrucaoEsquerdaRequirida;
} tCircuitoControle;
//Registradores
//ULA
char * AC;
char * MQ;
char * MBR;
//UC
char * IBR;
char * IR;
int PC;
int MAR;
tCircuitoControle CIRCUITOCONTROLE;

//FUNÇÕES AUXILIARES

int hexToDec(char * hexadecimal) {
    int i;
    int numero;
    int decimal = 0;
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

void inverte(char * value) {
    switch (value[0]) {
        case '0':
            value[0] = '8';
            break;
        case '1':
            value[0] = '9';
            break;
        case '2':
            value[0] = 'A';
            break;
        case '3':
            value[0] = 'B';
            break;
        case '4':
            value[0] = 'C';
            break;
        case '5':
            value[0] = 'D';
            break;
        case '6':
            value[0] = 'E';
            break;
        case '7':
            value[0] = 'F';
            break;
        case '8':
            value[0] = '0';
            break;
        case '9':
            value[0] = '1';
            break;
        case 'A':
            value[0] = '2';
            break;
        case 'B':
            value[0] = '3';
            break;
        case 'C':
            value[0] = '4';
            break;
        case 'D':
            value[0] = '5';
            break;
        case 'E':
            value[0] = '6';
            break;
        case 'F':
            value[0] = '7';
            break;
    }
}

void modulo(char * value) {
    if (!isPositivo(value)) {
        inverte(value);
    }
}

int isPositivo(char * value) {
    if (value[0] < '8') {
        return 1;
    }
    return 0;
}

void inverteAC() {
    switch (AC[0]) {
        case '0':
            AC[0] = '8';
            break;
        case '1':
            AC[0] = '9';
            break;
        case '2':
            AC[0] = 'A';
            break;
        case '3':
            AC[0] = 'B';
            break;
        case '4':
            AC[0] = 'C';
            break;
        case '5':
            AC[0] = 'D';
            break;
        case '6':
            AC[0] = 'E';
            break;
        case '7':
            AC[0] = 'F';
            break;
        case '8':
            AC[0] = '0';
            break;
        case '9':
            AC[0] = '1';
            break;
        case 'A':
            AC[0] = '2';
            break;
        case 'B':
            AC[0] = '3';
            break;
        case 'C':
            AC[0] = '4';
            break;
        case 'D':
            AC[0] = '5';
            break;
        case 'E':
            AC[0] = '6';
            break;
        case 'F':
            AC[0] = '7';
            break;
    }
}

void moduloAC() {
    if (!ACisPositivo()) {
        inverteAC();
    }
}

int ACisPositivo() {
    if (AC[0] < '8') {
        return 1;
    }
    return 0;
}



//Memoria
char memoria[TAMMEMORIA][TAMLINHA];

void inicializaRegistradores() {
    AC = malloc(10);
    MQ = malloc(10);
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
        strcpy(AC, MQ);
    } else if (strcmp(IR, "09")) { //LOAD MQ,M(X)
        strcpy(MBR, memoria[MAR]);
        strcpy(MQ, MBR);
    } else if (strcmp(IR, "21")) { //STOR M(X)
        strcpy(MBR, AC);
        strcpy(memoria[MAR], MBR);
    } else if (strcmp(IR, "01")) { //LOAD M(X)
        strcpy(MBR, memoria[MAR]);
        strcpy(AC, MBR);
    } else if (strcmp(IR, "02")) { //LOAD -M(X)
        strcpy(MBR, memoria[MAR]);
        strcpy(AC, MBR);
        inverteAC();
    } else if (strcmp(IR, "03")) { //LOAD |M(X)|
        strcpy(MBR, memoria[MAR]);
        strcpy(AC, MBR);
        moduloAC();
    } else if (strcmp(IR, "04")) { //LOAD -|(X)|
        strcpy(MBR, memoria[MAR]);
        strcpy(AC, MBR);
        moduloAC();
        inverteAC();
    } else if (strcmp(IR, "0D")) { //JUMP M(X,0:19)
        PC = MAR;
    } else if (strcmp(IR, "0E")) { //JUMP M(X,20:39)
        PC = MAR;
        CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 0;
    } else if (strcmp(IR, "0F")) { //JUMP+ M(X,0:19)
        strcpy(AC, MBR);
        if (ACisPositivo()) {
            PC = MAR;
        }
    } else if (strcmp(IR, "10")) { //JUMP+ M(X,20:39)
        strcpy(AC, MBR);
        if (ACisPositivo()) {
            PC = MAR;
            CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 0;
        }
    } else if (strcmp(IR, "05")) { //ADD M(X)
        strcpy(MBR, memoria[MAR]);
        int ac = hexToDec(AC);
        int mbr = hexToDec(MBR);
        ac =+ mbr;
        
         

    } else if (strcmp(IR, "07")) { //ADD |M(X)|
        strcpy(MBR, memoria[MAR]);
    } else if (strcmp(IR, "06")) { //SUB M(X)
        strcpy(MBR, memoria[MAR]);
    } else if (strcmp(IR, "08")) { //SUB |M(X)|
        strcpy(MBR, memoria[MAR]);
    } else if (strcmp(IR, "0B")) { //MUL M(X)
        strcpy(MBR, memoria[MAR]);
    } else if (strcmp(IR, "0C")) { //DIV M(X)
        strcpy(MBR, memoria[MAR]);
    } else if (strcmp(IR, "14")) { //LSH
        int i;
        for(i = 1; i <= 10; i++){
            AC[i - 1] = AC[i];
        }
        AC[10] = 0;
    } else if (strcmp(IR, "15")) { //RSH
        int i;
        for(i = 10; i >= 1; i--){
            AC[i] = AC[i - 1];
        }
        AC[0] = 0;
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

