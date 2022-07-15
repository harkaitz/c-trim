# TRIM

Single header C library with the `trim()` function. Can't understand
why this isn't in the standard library.

- [manpage](./trim.3.md)

## Examples

```
#include <str/trim.h>

int main() {
    fputs(trim("      Hello World    \n\n"), stdout);
    return 0;
}
```

```
#!/bin/sh -e
trim "    Hello world    "
```

## Collaborating

For making bug reports, feature requests and donations visit
one of the following links:

1. [gemini://harkadev.com/oss/](gemini://harkadev.com/oss/)
2. [https://harkadev.com/oss/](https://harkadev.com/oss/)

