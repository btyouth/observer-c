CFLAGS = -g -Wall -pedantic -ansi -Wno-unused-result -D _BSD_SOURCE -O2
CC = gcc

D_OBS = ./observer
D_EXAMPLE = ./example


main: $(D_EXAMPLE)/main.c $(D_OBS)/observer.o $(D_OBS)/observable.o
	@echo Building $@
	@$(CC) $(CFLAGS) -o $@.out $^
	./$@.out

$(D_OBS)/observable.o: $(D_OBS)/observable.c
	@echo Building $@
	@$(CC) $(CFLAGS) $^ -c -o $@
	@echo ----$@ DONE!

$(D_OBS)/observer.o: $(D_OBS)/observer.c
	@echo Building $@
	@$(CC) $(CFLAGS) $^ -c -o $@
	@echo ----$@ DONE!

function-pointer: $(D_EXAMPLE)/function-pointer.c
	@echo Building $@.out
	@$(CC) $(CFLAGS) $^ -o $(D_EXAMPLE)/$@.out
	@echo ----$@ Done!

clean:
	find . -name "*.out" -delete
	find . -name "*.o" -delete