# Raylib/raygui cross platform starter

This is a preconfigured project to create crossplatform games using raylib and raygui.

## Features

- Makefile to build the project on linux, windows or macos.
- Already configured for vscode's intellisense.
- Has ccls configured to have language server protocol feature on vim/neovim for example.
- Coding style configured in `.clang-format`, which is automatically used by vscode and can be used in other editor (like vim and emacs).
- Test mechanism.
- Continuous integration: when pushing on github, a github action build the game and run tests.

## Commands

- `make` or `make all`: build the game.
- `make run`: build the game and run it.
- `make clean`: remove all the files created with the `make all` command (`./build` and `./game`).
- `make test`: run the tests.

## Setup

### Windows

- Install msys2, for example in `C:\msys64` directory.
- Open the msys2 bash shell.
- `pacman -S mingw-w64-x86_64-make`.
- Add `C:\msys64\mingw64\bin` to the windows PATH.
- The with powershell or cmd you can go to the project directory and do `mingw-w64-x86_64-make`.

### Others

Just install clang.

Macos:

```
brew install llvm
```

Ubuntu:

```
sudo apt update
sudo apt install clang
```

Archlinux based:

```
pacman -Syu clang
```