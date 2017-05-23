CC := gcc
CFLAGS := -O -std=c99 -Wall -Wextra -Wformat-security -fstack-protector-strong -D_FORTIFY_SOURCE=2 -D_POSIX_C_SOURCE=200809L
LDFLAGS := -fPIC -shared

all: plugin

plugin: auth_script.c
	$(CC) $(CFLAGS) $(LDFLAGS) -I. -c auth_script.c
	$(CC) $(CFLAGS) $(LDFLAGS) -Wl,-soname,auth_script=.so -o auth_script.so auth_script.o

clean:
	rm -f *.o *.so
