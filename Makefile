# No uname.exe on MinGW!, but OS=Windows_NT on Windows!
# ifeq ($(UNAME),Msys) -> Windows
ifeq ($(OS),Windows_NT)
	PLATFORM_OS=WINDOWS
else
	UNAMEOS=$(shell uname)
	ifeq ($(UNAMEOS),Linux)
		PLATFORM_OS=LINUX
	endif
	ifeq ($(UNAMEOS),Darwin)
		PLATFORM_OS=OSX
	endif
endif

BUILD = build
COMMON_CFLAGS = -Wall -Wextra

TARGET1_SRC = $(wildcard src/*.c)
TARGET1_OBJ = $(patsubst %.c,$(BUILD)/%.o,$(TARGET1_SRC))
TARGET1_DEP = $(patsubst %.c,$(BUILD)/%.d,$(TARGET1_SRC))

ifeq ($(PLATFORM_OS),WINDOWS)
	CC = clang

	TARGET1_CFLAGS = \
		$(COMMON_CFLAGS) \
		-D PLATFORM_WINDOWS \
		-isystem./lib/raylib-3.7.0/win64_mingw-w64/include \
		-isystem./lib/raygui-2.6/src \
		-MMD # Option to generate a .d file during compilation.

	TARGET1_LDFLAGS = \
		-L./lib/raylib-3.7.0/win64_mingw-w64/lib \
		-lraylib -lopengl32 -lgdi32 -lwinmm
endif
ifeq ($(PLATFORM_OS),OSX)
	CC = clang

	TARGET1_CFLAGS = \
		$(COMMON_CFLAGS) \
		-D PLATFORM_MACOS \
		-I./lib/raylib-3.7.0/macos/include \
		-I./lib/raygui-2.6/src \
		-MMD # Option to generate a .d file during compilation.

	TARGET1_LDFLAGS = \
		./lib/raylib-3.7.0/macos/lib/libraylib.a \
		-framework OpenGL \
		-framework Cocoa \
		-framework IOKit \
		-framework CoreAudio \
		-framework CoreVideo
endif
ifeq ($(PLATFORM_OS),LINUX)
	CC = clang

	TARGET1_CFLAGS = \
		-D PLATFORM_LINUX \
		-I./lib/raylib-3.7.0/linux_amd64/include \
		-I./lib/raygui-2.6/src \
		-MMD # Option to generate a .d file during compilation.

	TARGET1_LDFLAGS = \
		./lib/raylib-3.7.0/linux_amd64/lib/libraylib.a \
		-lGL -lm -lpthread -ldl -lrt -lX11
endif

all: game

game: $(TARGET1_OBJ)
	$(CC) -o $@ $^ $(TARGET1_LDFLAGS)

# Include all dep files in the makefile, so if a .h change, the .c files are rebuilt.
-include $(TARGET1_DEP)

$(BUILD)/src/%.o: src/%.c
	$(CC) $(TARGET1_CFLAGS) -o $@ -c $<

clean:
	rm -fr $(BUILD) game

run: game
	./game

.PHONY: all clean run

$(shell mkdir -p build/src)
