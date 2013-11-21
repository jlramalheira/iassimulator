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

extern tlinha memoria[4096];
extern tULA ula;

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

long int mask(long int valor, long int mascara, int deslocamento) {
    return (valor & mascara) >> (deslocamento * 4);
}


