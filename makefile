all: arquivo.l
	clear
	flex -i arquivo.l
	gcc lex.yy.c -o arquivo -lfl
	./arquivo