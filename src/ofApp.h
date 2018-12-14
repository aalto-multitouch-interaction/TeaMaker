#pragma once

#include "ofxiOS.h"

#include "teaKind.h"

#define NUM_FLAV 4

class ofApp : public ofxiOSApp {
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
    teaKind flavour[NUM_FLAV];
    
    int sequence[NUM_FLAV];

    ofImage cupImage;
    ofImage orderImage;
    ofImage filterImage;
    ofImage backgroundImage;
    
    ofVec2f cupImagePoint;
    
    int orderColor;
    int prevOrderColor;
    
    ofVec2f initPos;
    
    bool nextOrder = false;
    bool newOrder = false;
    int cupVel;

};


