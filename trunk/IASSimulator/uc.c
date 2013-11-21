#include <stdio.h>
#include <stdlib.h>

#define TAMMEMORIA 4096
#define TAMLINHA 12

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

tUC uc;
extern tULA ula;

void init() {
    int i;
    for (i = 0; i < TAMMEMORIA; i++) {
        stor(i,0);
    }
    ula.AC = 0;
    ula.MBR = 0;
    ula.MQ = 0;
    uc.PC = 0;
    uc.MAR = 0;
    uc.IR = 0;
    uc.IBR = 0;
    uc.CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 1;
    uc.CIRCUITOCONTROLE.erro = 0;
    uc.CIRCUITOCONTROLE.proximaIBR = 0;
}

void busca() {
    if (uc.CIRCUITOCONTROLE.instrucaoEsquerdaRequirida) {
        if (uc.CIRCUITOCONTROLE.proximaIBR) {
            uc.IR = mask(uc.IBR, 0xFF000, 3);
            uc.MAR = mask(uc.IBR, 0x00FFF, 0);
            uc.PC++;
            uc.CIRCUITOCONTROLE.proximaIBR = 0;
        } else {
            uc.MAR = uc.PC;
            load(uc.MAR);
            uc.IR = mask(ula.MBR, 0xFF00000000, 8);
            uc.IBR = mask(ula.MBR, 0x00000FFFFF, 0);
            uc.MAR = mask(ula.MBR, 0x00FFF00000, 5);
            uc.CIRCUITOCONTROLE.proximaIBR = 1;
        }
    } else {
        uc.MAR = uc.PC;
        load(uc.MAR);
        uc.IR = mask(ula.MBR, 0x00000FF000, 3);
        uc.MAR = mask(ula.MBR, 0x0000000FFF, 0);
        uc.CIRCUITOCONTROLE.proximaIBR = 0;
        uc.CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 1;
        uc.PC++;
    }
}

void buscaOperandos() {
    load(uc.MAR);
}

void decodificaExecuta() {
    switch (uc.IR) {
        case 0xA: //load mq
            ula.AC = ula.MQ;
            break;
        case 0x9: //load mq,m(x)
            buscaOperandos();
            ula.MQ = ula.MBR;
            break;
        case 0x21: //stor m(x)
            ula.MBR = ula.AC;
            stor(uc.MAR);
            break;
        case 0x1: //load m(x)
            buscaOperandos();
            ula.AC = ula.MBR;
            break;
        case 0x2: //load -m(x)
            buscaOperandos();
            ula.AC = ula.MBR;
            ula.AC ^= 0x8000000000;
            break;
        case 0x3: //load |m(x)|
            buscaOperandos();
            ula.AC = ula.MBR;
            ula.AC &= 0x7FFFFFFFFF;
            break;
        case 0x4: //load -|m(x)|
            buscaOperandos();
            ula.AC = ula.MBR;
            ula.AC &= 0x7FFFFFFFFF;
            ula.AC ^= 0x8000000000;
            break;
        case 0xD: //jump m(x,0:19)
            uc.PC = uc.MAR;
            uc.CIRCUITOCONTROLE.proximaIBR = 0;
            break;
        case 0xE: //jump m(x,20:39)
            uc.PC = uc.MAR;
            uc.CIRCUITOCONTROLE.proximaIBR = 0;
            uc.CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 0;
            break;
        case 0xF: //jump+ m(x,0:19)
            if (ula.AC <= 0x7FFFFFFFFF){
                uc.PC = uc.MAR;
                uc.CIRCUITOCONTROLE.proximaIBR = 0;
            }
            break;
        case 0x10: //jump + m(x,20:39)
            if (ula.AC <= 0x7FFFFFFFFF){
                uc.PC = uc.MAR;
                uc.CIRCUITOCONTROLE.proximaIBR = 0;
                uc.CIRCUITOCONTROLE.instrucaoEsquerdaRequirida = 0;
            }
            break;
        case 0x5: //add m(x)
            buscaOperandos();
            circuitoLogicoAritmetico();
            break;
        case 0x6: //sub m(x)
            buscaOperandos();
            circuitoLogicoAritmetico();
            break;
        case 0x7: //add |m(x)|
            buscaOperandos();
            circuitoLogicoAritmetico();
            break;
        case 0x8: //sub |m(x)|
            buscaOperandos();
            circuitoLogicoAritmetico();
            break;
        case 0xB: //mul m(x)
            buscaOperandos();
            circuitoLogicoAritmetico();
            break;
        case 0xC: //div m(x)
            buscaOperandos();
            circuitoLogicoAritmetico();
            break;
        case 0x14: //lsh
            circuitoLogicoAritmetico();
            break;
        case 0x15: //rsh
            circuitoLogicoAritmetico();
            break;
        case 0x12: //stor m(x,8:19)
            ula.MBR = ula.AC;
            storEndereco(uc.MAR,1);
            break;
        case 0x13: //stor m(x,28:39)
            ula.MBR = ula.AC;
            storEndereco(uc.MAR,0);
            break;
        case 0x0: //exit
            uc.PC = -1;
    }
}
