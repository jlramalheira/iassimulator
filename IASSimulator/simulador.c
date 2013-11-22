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

extern tlinha * memoria;
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
    //pegar parametros
    int i;
    char * nomeArquivo = malloc(30);
    int inicioMemoria = 0;
    int fimMemoria = 60;
    int passoPasso = 0;
    int tamMemoria = 2000;
    
    for(i = 1; i <= argc-1; i++){
        char * comando = argv[i];
        if (strcmp(comando,"-m") == 0){
            tamMemoria = atoi(argv[++i]);
        }
        if (strcmp(comando,"-n") == 0){
            nomeArquivo = argv[++i];
        }
        if (strcmp(comando,"-p") == 0){
            passoPasso = 1;
        }
        if (strcmp(comando,"-i") == 0){
            inicioMemoria = atoi(argv[++i]);
        }
        if (strcmp(comando,"-f") == 0){
            fimMemoria = atoi(argv[++i]);
        }
    }
    init(tamMemoria);
    carregaMemoria("teste2.hex");
    imprimeMemoria(inicioMemoria, fimMemoria);
    do{
        busca();
        //imprimeRegistradores();
        //imprimeMemoria(inicioMemoria, fimMemoria);
        decodificaExecuta();
    } while (uc.PC != -1 && uc.CIRCUITOCONTROLE.erro != 1);
    imprimeMemoria(inicioMemoria, fimMemoria);
    return (0);
}