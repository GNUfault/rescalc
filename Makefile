CC    = gcc
SRC   = main.c
BIN   = rescalc
OPT   = s
MARCH = native
MTUNE = $(MARCH)
DEST  = /usr/local/bin


all: compile strip

compile:
	$(CC) $(SRC) -o $(BIN) -O$(OPT) -march=$(MARCH) -mtune=$(MTUNE)

strip:
	objcopy --strip-all $(BIN)

clean:
	rm $(BIN)

install: check-root
	mkdir -p $(DEST)  
	cp $(BIN) $(DEST)

remove: check-root
	rm -f $(DEST)/$(BIN)  

check-root:
	@if [ "$$(id -u)" -ne 0 ]; then \
		echo "Are you root?"; \
		exit 1; \
	fi

.PHONY: all compile strip clean install remove check-root
