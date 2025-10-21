#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <height> <aspect> (e.g., %s 480 4/3)\n", argv[0]);
        return 1;
    }

    int height = atoi(argv[1]);
    int num, denom;

    if (sscanf(argv[2], "%d/%d", &num, &denom) != 2 || denom == 0) {
        fprintf(stderr, "Invalid aspect ratio format.\n");
        return 1;
    }

    int width = (height * num) / denom;
    printf("%dx%d\n", width, height);
    return 0;
}
