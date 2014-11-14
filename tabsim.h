#include <stdlib.h> /* for atoi */
#include <stdio.h>
#include <string.h>

typedef struct _simbolo {
	struct _simbolo * sig;
	char nombre [20];
	int valor;
} simbolo;

 simbolo * crear();
 void insertar(simbolo **, simbolo *);
 simbolo *buscar(simbolo *, char[]);
 void imprimir(simbolo * );