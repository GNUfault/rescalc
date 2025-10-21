all: compile strip

compile:
  gcc main.c -o rescalc -Os -march=native -mtune=native

strip:
  objcopy --strip-all rescalc

clean:
  rm rescalc

install: check-root
  mkdir -p /usr/local/bin  
  cp rescalc /usr/local/bin

remove: check-root
  rm -f /usr/local/bin/rescalc  

check-root:
  @if [ "$$(id -u)" -ne 0 ]; then \
    echo "Are you root?"; \
    exit 1; \
  fi
