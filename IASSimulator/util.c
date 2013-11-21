#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

typedef struct {
    unsigned long int linha : 40;
} tlinha;

typedef struct {
    unsigned long int AC : 40;
    unsigned long int MQ : 40;
    unsigned long int MBR : 40;
} tULA;

typedef struct {
    unsigned int instrucaoEsquerdaRequirida : 1;
    unsigned int erro : 1;
    unsigned int proximaIBR : 1;
} tCircuitoControle;

typedef struct {
    unsigned long int IR : 8;
    unsigned long int IBR : 20;
    int MAR : 12;
    int PC : 12;
    tCircuitoControle CIRCUITOCONTROLE;
} tUC;

extern tlinha memoria[4096];
extern tULA ula;
extern tUC uc;

void converteGrava(char * hexadecimal, int j) {
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
    ula.MBR = decimal;
    stor(j);
}

void imprimeMemoria() {
    int i = 0;
    while (i < 57) {
        printf("%d - %lX\n", i, memoria[i].linha);
        i++;
    }
}

void imprimeRegistradores() {
    printf("AC: %ld - ", ula.AC);
    printf("MQ: %ld\n", ula.MQ);
    printf("MBR: %lX\n", ula.MBR);
    printf("IBR: %lX\n", uc.IBR);
    printf("IR: %lX\n", uc.IR);
    printf("PC: %d\n", uc.PC);
    printf("MAR: %d\n", uc.MAR);
}

long int mask(long int valor, long int mascara, int deslocamento) {
    return (valor & mascara) >> (deslocamento * 4);
}


