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

std::string OP_SHOT_DETECTION = "-sd";
std::string OP_CONTEXT_ANALYSIS = "-c";
std::string OP_UPLOAD = "-u";


#define MINIMAL_ARGS_OPERATION 2

//#define DEBUG


//prototypes
void operationShotDetection(std::string videoDir, std::string outputDir);
void opertationContextAnalysis(std::string shotsDir, std::string pythonDir, std::string pythonName);
void operationUpload(void);


//https ://learnopencv.com/deep-learning-based-object-detection-using-yolov3-with-opencv-python-c/
int main(int argc, char* argv[])
{

    for (int i = 0; i < argc; i++)
    {
        cout << "Argument " << i << " -> " << argv[i] << "\n";
    }

    
    /*
    //check arguments for operation
    if (argc < MINIMAL_ARGS_OPERATION)
    {
        cout << "Not enough arguments!";
        return 0;
    }
    
    //check operation
    std::string directory = argv[0];
    std::string operation = argv[1];
    */
    std::string directory = argv[0];
    std::string operation = "-c";
    if (operation.compare(OP_SHOT_DETECTION) == 0)
    {
        cout << "SHOTDETECTION!\n";
        
        operationShotDetection("C:\\project\\videos\\", "C:\\Users\\Klaus\\Desktop\\shots");
    }
    else if (operation.compare(OP_CONTEXT_ANALYSIS) == 0)
    {
        cout << "CONTEXT ANALYSIS!\n";
        opertationContextAnalysis("C:\\Users\\Klaus\\Desktop\\shots", "C:\\Users\\Klaus\\Desktop\\", "test2.py");
    }
    else if (operation.compare(OP_UPLOAD) == 0)
    {
        cout << "UPLOAD!";
    }
    else
    {
        cout << "Invalid operation! Operations are:\n " << OP_SHOT_DETECTION << " for shot detection\n " << OP_CONTEXT_ANALYSIS << " for context analysis\n " << OP_UPLOAD << " to upload into db";
    }
     
    
    
    return 0;

	
}
inline bool ends_with(std::string const& value, std::string const& ending)
{
    if (ending.size() > value.size()) return false;
    return std::equal(ending.rbegin(), ending.rend(), value.rbegin());
}
void operationShotDetection(std::string videoDir, std::string outputDir)
{
    
    using std::cout; using std::cin;
    using std::endl; using std::string;
    using std::filesystem::directory_iterator;

    vector<std::string> filePaths;
    vector<std::string> fileNames;
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


    //output discovered files 
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
        shotsLocation.append(fileNames[i]);
        shotsLocation.append("\\");
        fs::create_directory(shotsLocation);
        processVideo(f, shotsLocation);
        i++;
        cout << "Done!\n";
    }

    cout << "DONE DONE DONE!!!\n";

}

void opertationContextAnalysis(std::string shotsDir, std::string pythonDir, std::string pythonName)
{
    using std::cout; using std::cin;
    using std::endl; using std::string;
    using std::filesystem::directory_iterator;

    vector<std::string> filePaths;
    vector<std::string> fileNames;
    for (const auto& file : directory_iterator(shotsDir))
    {
        //std::string p{ file.path().u8string() };
        //cout << file.path() << "\n";
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
        processContextAnalysis(s, pythonDir, pythonName);
        cout << "Done!\n";
        i++;
    }


}

void operationUpload(void) 
{

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
