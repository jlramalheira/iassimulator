#include <stdio.h>
#include <stdlib.h>

#define TAMMEMORIA 4096
#define TAMLINHA 12

typedef struct {
    long int linha : 40;
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

tlinha memoria[4096];
extern tULA ula;
extern tUC uc;

void load(int index) {
    if (index < TAMMEMORIA) {
        ula.MBR = memoria[index].linha;
    } else {
        uc.CIRCUITOCONTROLE.erro = 1;
        return NULL;
    }
}

void stor(int index) {
    if (index < TAMMEMORIA) {
        memoria[index].linha = ula.MBR;
    } else {
        uc.CIRCUITOCONTROLE.erro = 1;
    }
}

void storEndereco(int index, int esquerda) {
    long int value = ula.MBR;
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
    do {
        fgets(linha, TAMLINHA, hex);
        converteGrava(linha,i++);
    } while (!feof(hex));
}

