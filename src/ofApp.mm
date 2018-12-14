#include "ofApp.h"


//--------------------------------------------------------------
void ofApp::setup(){
    
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);
    ofSetRectMode(OF_RECTMODE_CENTER);
    
    //ofSetBackgroundColor(0);
    
    ofVec2f pos[NUM_FLAV];
    pos[0].set(110, 110);
    pos[1].set(250, 110);
    pos[2].set(110, 250);
    pos[3].set(250, 250);
    
    int color[NUM_FLAV];
    color[0]=0xcc3366;
    color[1]=0x9ed860;
    color[2]=0xffd85a;
    color[3]=0x993300;
    
    prevOrderColor = 0x000000;
    
    for (int i=0; i<NUM_FLAV; i++ ){
        
        flavour[i].setup(pos[i], 115, color[i], i);
        
        sequence[i]=int(ofRandom(NUM_FLAV));
        if(i>0){
            for(int l=i-1;l>=0;l--){
                for(int k=i-1;k>=0;k--){
                    while(sequence[i]==sequence[k]){
                        sequence[i]=int(ofRandom(NUM_FLAV));
                    }
                }
            }
        }
    }

    orderColor = flavour[int(ofRandom(0,4))].GhexColor;
    
    cupImagePoint.set(895, 340);
    cupVel = 30;
    cupImage.load("cup.png");
    orderImage.load("order.png");
    filterImage.load("filter.png");
    backgroundImage.load("background.png");
    
}



//--------------------------------------------------------------
void ofApp::update(){
    
    for (int i=0; i<NUM_FLAV; i++ ){
        
        //CONTROLL TAP
        
        if (flavour[i].tapped){
            if(i==orderColor){
            }
            flavour[i].Gpos.x +=20;
            if (flavour[i].Gpos.x > 851) {
                flavour[i].tapped = false;
            }
        }
        //CHECK IF IT'S RIGHT
        if(flavour[i].Gpos.x > 650 && orderColor == flavour[i].GhexColor){
            flavour[i].match = true;
            if(flavour[i].match){
                flavour[i].Gpos.y +=12;
            }
        }
        //CHECK IF IT'S WRONG
        if(flavour[i].Gpos.x > 650 && orderColor != flavour[i].GhexColor){
            flavour[i].Gpos.y -=12;
        }
        //SUCCESS
        if (flavour[i].Gpos.y > 480) {
            orderColor = flavour[int(ofRandom(0,4))].GhexColor;
            while(orderColor == prevOrderColor){
                orderColor = flavour[int(ofRandom(0,4))].GhexColor;
            }
            prevOrderColor=orderColor;
            nextOrder = true;
            
            flavour[i].match = false;
            flavour[i].Gpos.set(flavour[i].initPos);
        }
        //INCORRECT
        if (flavour[i].Gpos.y < -70){
            flavour[i].Gpos.set(flavour[i].initPos);
        }
    }
    
    //NEXT ORDER
    if (nextOrder) {
        cupImagePoint.x += cupVel;
    } if (cupImagePoint.x > 1450) {
        nextOrder = false;
        newOrder = true;
    }
    
    //NEW ORDER
    if (newOrder) {
        cupImagePoint.x -= cupVel;
    } if (cupImagePoint.x <= 895) {
        newOrder = false;
    }
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    backgroundImage.draw(ofGetScreenHeight()/2, ofGetScreenWidth()/2);
    
    ofPushStyle();
    ofSetHexColor(orderColor);
    ofDrawEllipse(190, 480, 180, 180);
    ofPopStyle();
    
    orderImage.draw(190, 480);
    
    ofPushStyle();
    for (int i=0; i<NUM_FLAV; i++ ){
        
        flavour[i].draw();
    }
    ofPopStyle();
    
    filterImage.draw(flavour[0].Gpos.x, flavour[0].Gpos.y-5);
    filterImage.draw(flavour[1].Gpos.x, flavour[1].Gpos.y-5);
    filterImage.draw(flavour[2].Gpos.x, flavour[2].Gpos.y-5);
    filterImage.draw(flavour[3].Gpos.x, flavour[3].Gpos.y-5);
    
    cupImage.draw(cupImagePoint);
    
    
}

//--------------------------------------------------------------
void ofApp::exit(){
    
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
    for (int i=0; i<NUM_FLAV; i++ ){
        
        if (flavour[i].Gpos.distance(touch) < flavour[i].Gsize - 20) {
            flavour[i].tapped = true;
        }
    }
    
    
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}
