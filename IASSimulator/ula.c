#include <stdio.h>
#include <stdlib.h>

#define NUMEROMAX 549755813887

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

tULA ula;
extern tUC uc;

long int sinalNumero(long int numero) {
    if (numero > 0x7FFFFFFFFF) {
        numero ^= 0x8000000000;
        return numero *= (-1);
    }
    return numero;
}

long int numeroSinal(long int numero) {
    if (numero < 0) {
        numero *= (-1);
        numero += 0x8000000000;
        return numero;
    }
    return numero;
}

void circuitoLogicoAritmetico() {
    long int operador1;
    long int operador2;
    switch (uc.IR) {
        case 0x5: //add m(x)
            operador1 = sinalNumero(ula.AC);
            operador2 = sinalNumero(ula.MBR);
            operador1 += operador2;
            ula.AC = numeroSinal(operador1);
            break;
        case 0x6: //sub m(x)
            operador1 = sinalNumero(ula.AC);
            operador2 = sinalNumero(ula.MBR);
            operador1 -= operador2;
            ula.AC = numeroSinal(operador1);
            break;
        case 0x7: //add |m(x)|
            operador1 = sinalNumero(ula.AC);
            operador2 = sinalNumero(ula.MBR & 0x7FFFFFFFFF);
            operador1 += operador2;
            ula.AC = numeroSinal(operador1);
            break;
        case 0x8: //sub |m(x)|
            operador1 = sinalNumero(ula.AC);
            operador2 = sinalNumero(ula.MBR & 0x7FFFFFFFFF);
            operador1 += operador2;
            ula.AC = numeroSinal(operador1);
            break;
        case 0xB: //mul m(x)
            operador1 = sinalNumero(ula.MQ);
            operador2 = sinalNumero(ula.MBR);
            if ((operador2 * operador1) > NUMEROMAX) {
                ula.AC = numeroSinal(operador2 * operador1 - NUMEROMAX);
                ula.MQ = numeroSinal(operador1 * operador2);
            } else {
                ula.MQ = numeroSinal(operador1 * operador2);
            }
            break;
        case 0xC: //div m(x)
            operador1 = sinalNumero(ula.AC);
            operador2 = sinalNumero(ula.MBR);
            ula.AC = numeroSinal(operador1 % operador2);
            ula.AC = numeroSinal(operador1 % operador2);
            break;
        case 0x14: //lsh
            operador1 = sinalNumero(ula.AC);
            operador1<<=1;
            ula.AC = numeroSinal(operador1);
            break;
        case 0x15: //rsh
            operador1 = sinalNumero(ula.AC);
            operador1>>=1;
            ula.AC = numeroSinal(operador1);
            break;
    }
}