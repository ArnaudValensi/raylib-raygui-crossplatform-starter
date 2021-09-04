#include "utils.h"

#include <raylib.h>
#define RAYGUI_IMPLEMENTATION
#include <raygui.h>

#include <assert.h>
#include <stdio.h>

void game_run() {
    InitWindow(1280, 720, "Test"); // 1280x720 window named "Test"

    while (!WindowShouldClose()) {
        BeginDrawing();

        ClearBackground(RED);
        if (GuiButton((Rectangle){500, 200, 250, 60}, "TEST BUTTON")) {
            puts("Button pressed");
        }

        EndDrawing();
    }

    CloseWindow();
}

void test_something() {
    check(true == true);
}
