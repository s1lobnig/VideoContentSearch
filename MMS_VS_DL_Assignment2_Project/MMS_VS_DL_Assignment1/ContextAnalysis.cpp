#include "ContextAnalysis.h"

void processContextAnalysis(std::string shotsDir, std::string pythonLocation, std::string pythonName)
{
    char   psBuffer[128];
    FILE* pPipe;

    /* Run DIR so that it writes its output to a pipe. Open this
     * pipe with read text attribute so that we can read it
     * like a text file.
     */

    if ((pPipe = _popen("cd C:\\Users\\Klaus\\Desktop\\ & python test2.py", "rt")) == NULL)
        exit(1);

    /* Read pipe until end of file, or an error occurs. */

    while (fgets(psBuffer, 128, pPipe))
    {
        puts(psBuffer);
    }

    /* Close pipe and print return value of pPipe. */
    if (feof(pPipe))
    {
        printf("\nProcess returned %d\n", _pclose(pPipe));


    }
    else
    {
        printf("Error: Failed to read the pipe to the end.\n");
    }
}