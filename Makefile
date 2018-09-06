CC = i686-w64-mingw32-gcc
CPP = i686-w64-mingw32-g++
STRIP = strip

CFLAGS = -O2 -D_UNICODE

SOURCES = ACIO.o ACIOLauncher.o Debug.o Menu.o

all: ACIOLauncher.exe

ACIOLauncher.exe: $(SOURCES)
	$(CPP) $(CFLAGS) -flto -static -mconsole -municode -o $@ $^
	strip $@

clean:
	rm -f ACIOLauncher.exe *.o

%.o: %.cpp
	$(CPP) $(CFLAGS) -s -flto -Wall -c -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -s -flto -c -o $@ $<
