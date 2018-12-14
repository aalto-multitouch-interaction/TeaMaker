#pragma once

#include "ofxiOS.h"

class teaKind {
    
public:
    
    void setup(ofVec2f pos, float size, int hexColor, int Lid){
        Gpos=initPos=pos;
        Gsize=size;
        GhexColor=hexColor;
        Gid=Lid;
        tapped = false;
        match = false;
    }

    void draw(){
        ofSetHexColor(GhexColor);
        ofDrawEllipse(Gpos, Gsize, Gsize);
    }
    
    ofVec2f Gpos, initPos;
    float Gsize;
    int GhexColor;
    int Gid;
    bool tapped;
    bool match;
};

