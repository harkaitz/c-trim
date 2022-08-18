#include "../trim.h"
#include <stdio.h>
#include <libgen.h>

int main (int _argc, char *_argv[]) {
    _argv[0] = basename(_argv[0]);
    if (_argc == 1 || !strcmp(_argv[1], "-h") || !strcmp(_argv[1], "--help")) {
        fprintf(stderr, "Usage: %s STRING" "\n", _argv[0]);
        return 1;
    }
    trim_gaps(_argv[1], " \r\t\n");
    fputs(_argv[1], stdout);
    fputc('\n', stdout);
    return 0;
}
