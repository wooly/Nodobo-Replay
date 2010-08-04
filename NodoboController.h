//
//  NodoboController.h
//  Nodobo Replay
//
//  Created by Alisdair McDiarmid on 04/08/2010.
//  Copyright 2010 Nodobo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NodoboView.h"
#import "Session.h"
#import "Interaction.h"
#import "Screen.h"
#import "Touch.h"

@interface NodoboController : NSObject {
    NodoboView * view;
    NSTextField * label;
    NSButton * pause;
    NSSlider * slider;
    
    Session * session;
    Interaction * thisInteraction;
    Interaction * nextInteraction;
    NSEnumerator * enumerator;
    NSTimer * timer;
}

@property (assign) IBOutlet NodoboView * view;
@property (assign) IBOutlet NSTextField * label;
@property (assign) IBOutlet NSButton * pause;
@property (assign) IBOutlet NSSlider * slider;

@property (retain) Session * session;
@property (retain) NSEnumerator * enumerator;
@property (retain) Interaction * thisInteraction;
@property (retain) Interaction * nextInteraction;
@property (assign) NSTimer * timer;

- (void) rewind;
- (IBAction) pause: (id) sender;
- (IBAction) play: (id) sender;

- (void) resetTimer: (NSTimer *) timer;
- (void) resetTouch: (NSTimer *) timer;
- (void) updateInteraction;
- (void) updateLabel;
- (void) updateSlider;
- (IBAction) scrub: (id) sender;

@end
