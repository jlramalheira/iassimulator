/* 
 * File:   main.c
 * Author: max
 *
 * Created on 29 de Outubro de 2013, 16:26
 */

#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

#define TAMMEMORIA 4096
#define TAMLINHA 12

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
//Registradores
char * AC;
char * MQ;
char * MBR;
char * IBR;
char * IR;
int PC;
int MAR;

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
}

void carregaMemoria(char * arquivo) {
    FILE * hex;

    //receber nome do arquivo por parametro
    hex = fopen("teste2.hex", "r");

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

void busca() {
    //verifica se tem instrução em IBR
    if (strlen(IBR) == 0) {
        MAR = PC++;
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
    }
}

void decodifica() {
    
}

void buscaOperandos() {

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
    return (EXIT_SUCCESS);
}

