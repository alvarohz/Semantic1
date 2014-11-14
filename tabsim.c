 #include "tabsim.h"
 
 simbolo * crear() {
	return NULL;
 };
 void insertar(simbolo **pT, simbolo *s) {
	s->sig = (*pT);
	(*pT) = s;
 };

 simbolo *buscar(simbolo *t, char nombre[20]){
	while ( (t != NULL) && (strcmp(nombre, t->nombre)) )
		t = t->sig;
	return (t);
 };
 
 void imprimir(simbolo * t) {
	while (t != NULL) {
		printf("%s\n", t->nombre);		
		t = t->sig;
	}
};