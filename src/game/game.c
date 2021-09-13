#include "utils.h"

#include <raylib.h>
#define RAYGUI_IMPLEMENTATION
#include <raygui.h>

#if defined(PLATFORM_WEB)
    #include <emscripten/emscripten.h>
#endif

static void Update() {
    BeginDrawing();

    ClearBackground(RED);
    if (GuiButton((Rectangle){500, 200, 250, 60}, "TEST BUTTON")) {
        puts("Button pressed");
    }

    EndDrawing();
}

void GameRun() {
    InitWindow(1280, 720, "Game");

#if defined(PLATFORM_WEB)
    emscripten_set_main_loop(Update, 60, 1);
#else
    SetTargetFPS(60);       // Set our game to run at 60 frames-per-second
    //--------------------------------------------------------------------------------------

    // Main game loop
    while (!WindowShouldClose())    // Detect window close button or ESC key
    {
        Update();
    }
#endif

    CloseWindow();
}

void test_Something() {
    check(true == true);
}
