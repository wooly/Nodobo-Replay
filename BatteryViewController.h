//
//  BatteryViewController.h
//  Nodobo Replay
//
//  Created by Stephen Bell on 18/05/2011.
//  Copyright 2011 Nodobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BatteryView.h"
#import "CorePlot/CorePlot.h"

@interface BatteryViewController : NSObject <CPPlotDataSource> {
	IBOutlet CPLayerHostingView *batteryView;
//	BatteryView *batteryView;
	CPXYGraph *graph;
	NSArray *plotData;
}

@property (assign) IBOutlet CPLayerHostingView *batteryView;
@property (nonatomic, retain) CPXYGraph *graph;

@end
