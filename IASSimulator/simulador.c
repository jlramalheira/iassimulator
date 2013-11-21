#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <string.h>

typedef struct {
    unsigned long int linha : 40;
} tlinha;

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

int main(int argc, char** argv) {
    init();
    carregaMemoria("teste2.hex");
    imprimeMemoria();
    do{
        busca();
        imprimeRegistradores();
        imprimeMemoria();
        decodificaExecuta();
    } while (uc.PC != -1 && uc.CIRCUITOCONTROLE.erro != 1);
    imprimeMemoria();
    return (0);
}