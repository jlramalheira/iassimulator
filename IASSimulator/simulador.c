#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

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

extern tlinha memoria[4096];
extern tULA ula;
extern tUC uc;

/*==============================================================================
 *Funções Auxiliares
 */


/*==============================================================================
 * Gerenciamento de Memória
 */


/*==============================================================================
 *Unidade Lógica e Aritmética
 */



/*==============================================================================
 *Unidade de Controle
 */

/*==============================================================================
 *Programa Principal
 */

void imprimeRegistradores() {
    printf("AC: %ld - ", ula.AC);
    printf("MQ: %ld\n", ula.MQ);
    printf("MBR: %lX\n", ula.MBR);
    printf("IBR: %lX\n", uc.IBR);
    printf("IR: %lX\n", uc.IR);
    printf("PC: %d\n", uc.PC);
    printf("MAR: %d\n", uc.MAR);
}
int main(int argc, char** argv) {
    init();
    carregaMemoria("teste2.hex");
    imprimeMemoria();
    do{
        busca();
        imprimeRegistradores();
        decodificaExecuta();
    } while (uc.PC != -1 && uc.CIRCUITOCONTROLE.erro != 1);
    imprimeMemoria();
    return (0);
}