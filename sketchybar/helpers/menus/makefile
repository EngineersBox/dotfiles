bin/menus: menus.c | bin
	clang -std=c99 -O3 -F/System/Library/PrivateFrameworks/ -framework Carbon -framework SkyLight $< -o $@
	chmod +x bin/menus

bin:
	mkdir bin
