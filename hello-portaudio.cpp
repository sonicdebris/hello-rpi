#include <stdio.h>
#include "portaudio.h"

int main(void)
{
    PaError res = Pa_Initialize();
    printf("Portaudio initialization result: %d\n", res);
    if (res != paNoError) {
        printf("Error: %s\n",Pa_GetErrorText(res));    
        PaError hostError = (PaError) Pa_GetHostError();
        printf("Host error: %s\n",Pa_GetErrorText(hostError));
    }
    Pa_Terminate();
    return res;
}


