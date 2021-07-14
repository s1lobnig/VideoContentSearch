// MMS_VS_DL_Assignment2.cpp : Diese Datei enthält die Funktion "main". Hier beginnt und endet die Ausführung des Programms.
//




#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>
#include <string.h>
//#include <stdarg.h>
#include "opencv2/highgui.hpp"
#include <list>
#include <iterator>
#include <filesystem>
#include <fstream>
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include "Shotdetection.h"
#include "ContextAnalysis.h"

namespace fs = std::filesystem;
using namespace cv;
using namespace std;




#define OPERATION_SUCCESSFULL   0
#define OPERATION_FAILED        1

#define PYTHON_SCRIPT_NAME "torchImageClassification.py"

#define NUM_OF_CMD_PARAMS       6

#define CMD_PARAM_VIDEOS_DIR    1
#define CMD_PARAM_HOST          2
#define CMD_PARAM_DB_NAME       3
#define CMD_PARAM_USER_NAME     4
#define CMD_PARAM_PW            5



//#define DEBUG


//prototypes
int operationShotDetection(std::string videoDir, std::string outputDir);
int opertationContextAnalysis(std::string shotsDir, std::string pythonDir, std::string pythonName, std::string pHost, std::string pDbName, std::string pUserName, std::string pPw);



//https ://learnopencv.com/deep-learning-based-object-detection-using-yolov3-with-opencv-python-c/
int main(int argc, char* argv[])
{

    for (int i = 0; i < argc; i++)
    {
        cout << "Argument " << i << " -> " << argv[i] << "\n";
    }

    
    
    //check arguments for operation
    if (argc < NUM_OF_CMD_PARAMS)
    {
        cout << "Not enough arguments!\n";
        cout << "[arg1] = directory to folder with videos\n";
        cout << "[arg2] = SQL Host\n";
        cout << "[arg3] = SQL DB-Name\n";
        cout << "[arg4] = SQL User-Name\n";
        cout << "[arg5] = SQL PW\n";
        return 0;
    }
    
    
    
    //exe directory
    std::string exeDirectory = argv[0];
    size_t lastIndex = exeDirectory.find_last_of("\\");
    exeDirectory = exeDirectory.substr(0, lastIndex);
    
    //shots directory
    std::string shotsDirectory = exeDirectory;
    shotsDirectory.append("\\shots");
    
    //video directory
    std::string videoDirectory = argv[CMD_PARAM_VIDEOS_DIR];

    //python name
    std::string pythonName = PYTHON_SCRIPT_NAME;

    //host
    std::string host = argv[CMD_PARAM_HOST];
    
    //db name
    std::string dbName = argv[CMD_PARAM_DB_NAME];

    //user name
    std::string userName = argv[CMD_PARAM_USER_NAME];

    //pw
    std::string pw = argv[CMD_PARAM_PW];
    
   
    
    //step 1: process shots
    if (operationShotDetection(videoDirectory, shotsDirectory) == OPERATION_SUCCESSFULL)
    {
        //step 2: process context analysis
        opertationContextAnalysis(shotsDirectory, exeDirectory, pythonName, host, dbName, userName, pw);
    }
    else
    {
        cout << "Application stopped with an error!";
    }
              
    return 0;
}

inline bool ends_with(std::string const& value, std::string const& ending)
{
    if (ending.size() > value.size()) return false;
    return std::equal(ending.rbegin(), ending.rend(), value.rbegin());
}

int operationShotDetection(std::string videoDir, std::string outputDir)
{
    cout << "Starting shotdetection!";
    using std::cout; using std::cin;
    using std::endl; using std::string;
    using std::filesystem::directory_iterator;

    vector<std::string> filePaths;
    vector<std::string> fileNames;
    
    //check if folder exists
    if (fs::exists(videoDir))
    {
        cout << "Found folder " << videoDir;
    }
    else
    {
        cout << "Folder " << videoDir << " does not exist!";
        return OPERATION_FAILED;
    }

    //collect .mp4 clips inside the folder
    for (const auto& file : directory_iterator(videoDir))
    {        
        std::string p{ file.path().u8string() };
        if (ends_with(p, "mp4"))
        {
            //cout << file.path() << endl;
            filePaths.push_back(file.path().u8string());
            fileNames.push_back(file.path().filename().u8string());

        }
    }


    //output discovered clips 
    cout << "Found the following videos:\n";
    for (const auto& f : fileNames)
    {
        cout << f << "\n";
    }

    
    //process shot detection on each video
    cout << "Performing shot detection on:\n";
    int i = 0;
    for (const auto& f : filePaths)
    {
        cout << fileNames[i] << " .... ";
        std::string shotsLocation = outputDir;
        shotsLocation.append("\\");
        size_t lastindex = fileNames[i].find_last_of(".");
        std::string trimmedFileName = fileNames[i].substr(0, lastindex);
        shotsLocation.append(trimmedFileName);
        shotsLocation.append("_mp4");
        shotsLocation.append("\\");
        fs::create_directory(shotsLocation);
        processVideo(f, shotsLocation);
        i++;
        cout << "Done!\n";
    }

    cout << "Shotdetection DONE!\n";
    return OPERATION_SUCCESSFULL;
}

int opertationContextAnalysis(std::string shotsDir, std::string pythonDir, std::string pythonName, std::string pHost, std::string pDbName, std::string pUserName, std::string pPw)
{

    //collect available folders with shots
    //folder must end with "mp4"
    using std::cout; using std::cin;
    using std::endl; using std::string;
    using std::filesystem::directory_iterator;

    vector<std::string> filePaths;
    vector<std::string> fileNames;
    for (const auto& file : directory_iterator(shotsDir))
    {
        
        std::string p{ file.path().u8string() };
        if (ends_with(p, "mp4") && file.is_directory())
        {                        
            filePaths.push_back(file.path().u8string());
            fileNames.push_back(file.path().filename().u8string());
        }
    }

    //show available movie shots
    cout << "Available shots:\n";
    for (const auto& s : fileNames)
    {
        cout << s << "\n";
    }

    cout << "Process shots of:\n";
    int i = 0;
    for (const auto& s : filePaths)
    {
        cout << fileNames[i] << " ... ";
        processContextAnalysis(s, pythonDir, pythonName, pHost, pDbName, pUserName, pPw);
        cout << "Done!\n";
        i++;
    }
    return OPERATION_SUCCESSFULL;

}




// Programm ausführen: STRG+F5 oder Menüeintrag "Debuggen" > "Starten ohne Debuggen starten"
// Programm debuggen: F5 oder "Debuggen" > Menü "Debuggen starten"

// Tipps für den Einstieg: 
//   1. Verwenden Sie das Projektmappen-Explorer-Fenster zum Hinzufügen/Verwalten von Dateien.
//   2. Verwenden Sie das Team Explorer-Fenster zum Herstellen einer Verbindung mit der Quellcodeverwaltung.
//   3. Verwenden Sie das Ausgabefenster, um die Buildausgabe und andere Nachrichten anzuzeigen.
//   4. Verwenden Sie das Fenster "Fehlerliste", um Fehler anzuzeigen.
//   5. Wechseln Sie zu "Projekt" > "Neues Element hinzufügen", um neue Codedateien zu erstellen, bzw. zu "Projekt" > "Vorhandenes Element hinzufügen", um dem Projekt vorhandene Codedateien hinzuzufügen.
//   6. Um dieses Projekt später erneut zu öffnen, wechseln Sie zu "Datei" > "Öffnen" > "Projekt", und wählen Sie die SLN-Datei aus.
