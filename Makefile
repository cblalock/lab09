FILE = <file name no extension>

build: $(FILE).s
	gcc -Wall -g $(FILE).s -o $(FILE) -lm -fno-pie -no-pie

.PHONY: db

db:
	gdb -tui $(FILE)

run:
	./$(FILE)