all: aula4.l aula4.y
	clear
	flex -i aula4.l
	bison aula4.y
	gcc aula4.tab.c -o Calculadora -lfl -lm
	./Calculadora