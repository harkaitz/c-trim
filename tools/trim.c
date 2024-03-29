#include "../trim.h"
#include <stdio.h>
#include <libgen.h>

int main (int argc, char *argv[]) {
    argv[0] = basename(argv[0]);
    if (argc == 1 || !strcmp(argv[1], "-h") || !strcmp(argv[1], "--help")) {
        fprintf(stderr, "Usage: %s STRING" "\n", argv[0]);
        return 1;
    }
    printf("%s\n", trim(argv[1]));
    return 0;
}
