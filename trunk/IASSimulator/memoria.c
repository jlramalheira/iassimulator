#include <stdio.h>
#include <stdlib.h>

#define TAMLINHA 12

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

tlinha * memoria;
extern tULA ula;
extern tUC uc;

int tamanhoMemoria;

void iniciaMemoria(int tamMemoria) {
    if (tamMemoria > 4096) {
        printf("O tamanho máximo da memória é 4096, portanto a memória terá somente este tamanho!\n");
        tamanhoMemoria = 4096;
    }
    tamanhoMemoria = tamMemoria;
    memoria = (tlinha *) malloc(tamanhoMemoria * sizeof (tlinha));
}

void load(int index) {
    __asm__(
            "movq $0, %rax\n\t"
            "movl %edi, %eax \n\t"
            "cmp tamanhoMemoria(%rip), %rax \n\t"
            "jge load_else \n\t"
            "movq memoria(%rip), %rbx\n\t"
            "shlq $3, %rax \n\t"
            "addq %rax, %rbx \n\t"
            "movq (%rbx), %rbx \n\t"
            "movq %rbx, ula+16(%rip) \n\t"
            "jmp load_exit \n\t"
            "load_else:\n\t"
            //"movb $1, uc+8(%rip)\n\t"
            "movzbl uc+8(%rip), %eax\n\t"
            "orl $2, %eax\n\t"
            "movb %al, uc+8(%rip) \n\t"
            "load_exit: \n\t"
            );
    //push index chama assembly in line
    /*
        if (index < tamanhoMemoria) {
            ula.MBR = memoria[index].linha;
        } else {
            uc.CIRCUITOCONTROLE.erro = 1;
        }
     */
}

void stor(int index) {
        __asm__(
            "movq $0, %rax\n\t"
            "movl %edi, %eax \n\t"
            "cmp tamanhoMemoria(%rip), %rax \n\t"
            "jge stor_else \n\t"
            "movq memoria(%rip), %rbx\n\t"
            "shlq $3, %rax \n\t"
            "addq %rax, %rbx \n\t"
            "movq ula+16(%rip), %rax \n\t"
            "movq %rax, (%rbx) \n\t"
            "jmp stor_exit \n\t"
            "stor_else:\n\t"
            //"movb $1, uc+8(%rip)\n\t"
            "movzbl uc+8(%rip), %eax\n\t"
            "orl $2, %eax\n\t"
            "movb %al, uc+8(%rip) \n\t"
            "stor_exit: \n\t"
            );
/*
    if (index < tamanhoMemoria) {
        memoria[index].linha = ula.MBR;
    } else {
        uc.CIRCUITOCONTROLE.erro = 1;
    }
*/
}

void storEndereco(int index, int esquerda) {
    long int value = ula.MBR;
    if (index < tamanhoMemoria) {
        if (esquerda) {
            value = value << 20;
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
        converteGrava(linha, i++);
    } while (!feof(hex));
}

