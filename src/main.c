#include "raylib.h"
#define RAYGUI_IMPLEMENTATION
#include "raygui.h"
#include <stdio.h>

int main(void) {
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

    return 0;
}
