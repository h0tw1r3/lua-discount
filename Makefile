LIB_NAME= lua-discount
VERSION= 1.4

# change these to reflect your Lua installation
LUA= /usr
LUAINC= $(LUA)/include/lua5.1
LUALIB= $(LUA)/lib
LUABIN= $(LUA)/bin

# probably no need to change anything below here
CC= gcc
CFLAGS= $(INCS) $(WARN) -O2 -fPIC ${DEFS}
WARN= -Wall
INCS= -I$(LUAINC)
DEFS = 

LIBS = -lmarkdown
OBJS= ldiscount.o
SOS= discount.so

all: $(SOS)

$(SOS): $(OBJS)
	$(CC) -o $@ -shared $(OBJS) $(LIBS)

.PHONY: clean tar
clean:
	rm -f $(OBJS) $(SOS) core core.* a.out

tar: clean
	git archive --format=tar --prefix=$(LIB_NAME)-$(VERSION)/ $(VERSION) | bzip2 > $(LIB_NAME)-$(VERSION).tar.bz2

