#include <alsa/asoundlib.h>
#include <stdio.h>

int main() {
    const char* v = snd_asoundlib_version();
    printf("Version of alsa: %s\n", v);
}
