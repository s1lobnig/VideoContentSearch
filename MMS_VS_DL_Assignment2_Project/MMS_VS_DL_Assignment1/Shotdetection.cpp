// MMS_VS_DL_Assignment1.cpp : Diese Datei enthält die Funktion "main". Hier beginnt und endet die Ausführung des Programms.
//


//https://medium.com/@subwaymatch/opencv-410-with-vs-2019-3d0bc0c81d96

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <iostream>
#include <string.h>
//#include <stdarg.h>
#include "opencv2/highgui.hpp"
#include <list>
#include <iterator>
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
#include "Shotdetection.h"

using namespace cv;
using namespace std;

//#define DEBUG



#define T_H 160000
#define T_D 20000

//prototypes
void calcHistogram64BinV1(Mat img, vector<float>& destHist, bool show);
void calcHistogram64BinV2(Mat img, vector<float>& destHist, bool show);
float manhattenDistance(vector<float> vec1, vector<float> vec2);



void processVideo(std::string videoLocation, std::string shotsLocation)
{
	//Mat im;
	Mat frame;
	VideoCapture cap = VideoCapture(videoLocation);
	int waitTime = 1000 / cap.get(CAP_PROP_FPS);



	//list <Mat> frameList;
	list<unsigned long> shotBoundaries;
	vector<float> histNew(64);
	vector<float> histOld(64);
	float distance = 0.0;
	float distanceSum = 0.0;
	bool tD_triggered = false;
	unsigned long frameCounter = 0;

	//read first frame to have a old histogram to compare
	cap.read(frame);
	calcHistogram64BinV2(frame, histOld, false);
	//im = frame;
	//frameList.push_front(frame);
	shotBoundaries.push_back(0);
	imshow("Current shot", frame);


	//get next frame
	while (cap.read(frame))
	{

		//compute histogram
		calcHistogram64BinV2(frame, histNew, false);
		//calculate distance
		distance = manhattenDistance(histOld, histNew);
#ifdef DEBUG
		cout << "Distance: " << manhattenDistance(histOld, histNew) << "\n";
#endif

		if (distance > T_D)
		{
			tD_triggered = true;
		}

		if (tD_triggered)
		{
#ifdef DEBUG
			cout << "T_D triggered! DistanceSum = " << distanceSum << "\n";
#endif
			distanceSum += abs(distance - T_D);
		}

		if ((distance > T_H) || (distanceSum > T_H))
		{
#ifdef DEBUG
			cout << "Shot detected!\n";
#endif
			distanceSum = 0;
			tD_triggered = false;

			//frameList.push_front(frame);
			imshow("Current shot", frame);
			shotBoundaries.push_back(frameCounter);

		}

		imshow("Video", frame);
		histOld = histNew;
		frameCounter++;


		//check exit condition
		int key = waitKey(waitTime);
		if (key == 'q')
			break;

	}


	cout << "Storing shots into defind folder: " << shotsLocation << "\n";


	int i = 0;
	unsigned long shotStart = 0;
	unsigned long shotStop = 0;
	for (auto const& x : shotBoundaries) {
		//imshow("Shot " + i, x);
		//cout << "Shot at frame: " << x << "\n";
		shotStop = x;

		//calculate frame in the middle of the shot
		unsigned long shotLength = shotStop - shotStart;
		unsigned long middleFrame = shotStart + (shotLength / 2);

		//extract frame from video
		Mat frameToStore;
		cap.set(CAP_PROP_POS_FRAMES, middleFrame);
		cap.read(frameToStore);

		//store frame

		std::string fileDestination = shotsLocation;//) << std::string(i);// << " " << shotStart << "-" << shotStop << ".jpg";
		fileDestination.append("Shot");
		fileDestination.append(std::to_string(i));
		fileDestination.append(std::string(" "));
		fileDestination.append(std::to_string(shotStart));
		fileDestination.append(std::string("-"));
		fileDestination.append(std::to_string(shotStop));
		fileDestination.append(".jpg");
		cout << "Writing to " << fileDestination << "\n";
		imwrite(fileDestination, frameToStore);
		shotStart = shotStop;
		i++;
	}
	//cout << "Done!";
	/*while (1)
	{
		int key = waitKey(waitTime);
		if (key == 'q')
			break;
	}
	*/
}


string type2str(int type) {
	string r;

	uchar depth = type & CV_MAT_DEPTH_MASK;
	uchar chans = 1 + (type >> CV_CN_SHIFT);

	switch (depth) {
	case CV_8U:  r = "8U"; break;
	case CV_8S:  r = "8S"; break;
	case CV_16U: r = "16U"; break;
	case CV_16S: r = "16S"; break;
	case CV_32S: r = "32S"; break;
	case CV_32F: r = "32F"; break;
	case CV_64F: r = "64F"; break;
	default:     r = "User"; break;
	}

	r += "C";
	r += (chans + '0');

	return r;
}


void calcHistogram64BinV1(Mat img, vector<float>& destHist, bool show)
{
	int channels = img.channels();
	int nRows = img.rows;
	int nCols = img.cols * channels;
	if (img.isContinuous()) //matrix without gaps?
		nCols *= nRows; //number of bytes (including all channels)
	vector<float> hist(256);
	//initialize with zeros
	for (int i = 0; i < 256; ++i)
		hist[i] = 0.0;
	uchar b, g, r;
	uchar* p = img.ptr<uchar>(0);

	for (int j = 0; j < nCols;) {
		b = (p[j++] & 0xC0); //two msb(1100)
		g = (p[j++] & 0xE0) >> 2; //three msb(1110)
		r = (p[j++] & 0xE0) >> 5; //three msb(1110)
		hist[b | g | r]++;
	} //todo: normalize, if needed

	//create 64bin histogram
	vector<float> nhist(64);
	for (int i = 0; i < 64; i++)
	{
		nhist[i] = 0.0;
	}

	for (int i = 0; i < 256; i++)
	{
		nhist[i / 4] += hist[i];
	}


	if (show) {
		cout << "Hitogram64binV1:\n";
		for (int i = 0; i < nhist.size(); i++)
		{
			cout << "[" << i << "] = " << nhist[i] << " ";
			cout << endl;

		}
		int hist_w = 1080, hist_h = 720;
		int bin_w = cvRound((double)hist_w / 64);
		Mat histImage(hist_h, hist_w, CV_8UC3, Scalar(0, 0, 0));
		for (int i = 1; i < 64; i++)
		{
			line(histImage, Point(bin_w * (i - 1), hist_h - cvRound(nhist[i - 1])),
				Point(bin_w * (i), hist_h - cvRound(nhist[i])),
				Scalar(255, 0, 0), 2, 8, 0);
		}
		imshow("Hitogram64binV1", histImage);
	}

	//this should be somewhere included in the code above and the size of destHist should be checked
	for (int i = 0; i < destHist.size(); i++)
	{
		destHist[i] = nhist[i];
	}
}

void calcHistogram64BinV2(Mat img, vector<float>& destHist, bool show)
{
	int channels = img.channels();
	int nRows = img.rows;
	int nCols = img.cols * channels;
	if (img.isContinuous()) //matrix without gaps?
		nCols *= nRows; //number of bytes (including all channels)
	vector<float> hist(64);
	//initialize with zeros
	for (int i = 0; i < 64; ++i)
		hist[i] = 0.0;
	uchar b, g, r;
	uchar* p = img.ptr<uchar>(0);

	//changed to 2bit for each value bgr
	for (int j = 0; j < nCols;) {
		b = (p[j++] & 0xC0) >> 2; //two msb(1100)
		g = (p[j++] & 0xE0) >> 4; //three msb(1110)
		r = (p[j++] & 0xE0) >> 6; //three msb(1110)
		hist[(b | g | r)]++;
	} //todo: normalize, if needed

	if (show)
	{
		cout << "Histogram64BinV2:\n";
		for (int i = 0; i < hist.size(); i++)
		{
			cout << "[" << i << "] = " << hist[i] << " ";
			cout << endl;

		}
		int hist_w = 1080, hist_h = 720;
		int bin_w = cvRound((double)hist_w / 64);
		Mat histImage(hist_h, hist_w, CV_8UC3, Scalar(0, 0, 0));

		for (int i = 1; i < 64; i++)
		{

			line(histImage, Point(bin_w * (i - 1), hist_h - cvRound(hist[i - 1])),
				Point(bin_w * (i), hist_h - cvRound(hist[i])),
				Scalar(256, 0, 0), 2, 8, 0);
			//Scalar(((i & 0x03)) * 64, ((i & 0x0C) >> 2) * 64, ((i & 0x30) >> 4) * 64), 2, 8, 0);
		}


		imshow("Histogram64BinV2", histImage);
	}


	for (int i = 0; i < destHist.size(); i++)
	{
		destHist[i] = hist[i];
	}
}


float manhattenDistance(vector<float> vec1, vector<float> vec2)
{
	float distance = 0.0;
	//todo: check vector sizes
	for (int i = 0; i < vec1.size(); i++)
	{
		distance += abs(vec1[i] - vec2[i]);
	}
	return distance;
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
