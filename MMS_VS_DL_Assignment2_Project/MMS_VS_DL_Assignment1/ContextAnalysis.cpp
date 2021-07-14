#include "ContextAnalysis.h"


void processContextAnalysis(std::string shotsDir, std::string pythonLocation, std::string pythonName, std::string pHost, std::string pDbName, std::string pUserName, std::string pPw)
{
    char   psBuffer[128];
    FILE* pPipe;

    /* Run DIR so that it writes its output to a pipe. Open this
     * pipe with read text attribute so that we can read it
     * like a text file.
     */
    cout << "Calling python program!\n";

    //prepare command
    std::string pythonCmd = "cd ";
    pythonCmd.append(pythonLocation);
    pythonCmd.append(" & python ");
    pythonCmd.append(pythonName);
    pythonCmd.append(" ");
    pythonCmd.append(shotsDir);
    pythonCmd.append(" ");
    pythonCmd.append(pHost);
    pythonCmd.append(" ");
    pythonCmd.append(pDbName);
    pythonCmd.append(" ");
    pythonCmd.append(pUserName);
    pythonCmd.append(" ");
    pythonCmd.append(pPw);
    pythonCmd.append(" ");
        
    if ((pPipe = _popen(pythonCmd.c_str(), "rt")) == NULL)
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