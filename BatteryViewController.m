//
//  BatteryViewController.m
//  Nodobo Replay
//
//  Created by Stephen Bell on 18/05/2011.
//  Copyright 2011 Nodobo. All rights reserved.
//

#import "BatteryViewController.h"


@implementation BatteryViewController

@synthesize batteryView;
@synthesize graph;

- (id) init
{
    self = [super init];
    
    if (self == nil)
        return nil;
	
	NSLog(@"BLOOOP!");
	
	batteryView = [[CPLayerHostingView alloc] initWithFrame:CGRectMake(0,0,200,200)];
	graph = [[CPXYGraph alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
	// If you make sure your dates are calculated at noon, you shouldn't have to 
    // worry about daylight savings. If you use midnight, you will have to adjust
    // for daylight savings time.
    NSDate *refDate = [NSDate dateWithNaturalLanguageString:@"12:00 Oct 29, 2009"];
    NSTimeInterval oneDay = 24 * 60 * 60;
	
    // Create graph from theme
	CPTheme *theme = [CPTheme themeNamed:kCPDarkGradientTheme];
	[graph applyTheme:theme];
	self.batteryView.hostedLayer = self.graph;
	NSLog(@"Bloop: %@, %@", self.batteryView, batteryView);
	NSLog(@"Bloop: %@, %@", self.graph, graph);
//    
//    // Setup scatter plot space
//    CPXYPlotSpace *plotSpace = (CPXYPlotSpace *) self.graph.defaultPlotSpace;
//    NSTimeInterval xLow = 0.0f;
//    plotSpace.xRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromFloat(xLow) length:CPDecimalFromFloat(oneDay*5.0f)];
//    plotSpace.yRange = [CPPlotRange plotRangeWithLocation:CPDecimalFromFloat(1.0) length:CPDecimalFromFloat(3.0)];
//    
//    // Axes
//	CPXYAxisSet *axisSet = (CPXYAxisSet *)self.graph.axisSet;
//    CPXYAxis *x = axisSet.xAxis;
//    x.majorIntervalLength = CPDecimalFromFloat(oneDay);
//    x.orthogonalCoordinateDecimal = CPDecimalFromString(@"2");
//    x.minorTicksPerInterval = 0;
//    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
//    dateFormatter.dateStyle = kCFDateFormatterShortStyle;
//    CPTimeFormatter *timeFormatter = [[[CPTimeFormatter alloc] initWithDateFormatter:dateFormatter] autorelease];
//    timeFormatter.referenceDate = refDate;
//    x.labelFormatter = timeFormatter;
//	
//    CPXYAxis *y = axisSet.yAxis;
//    y.majorIntervalLength = CPDecimalFromString(@"0.5");
//    y.minorTicksPerInterval = 5;
//    y.orthogonalCoordinateDecimal = CPDecimalFromFloat(oneDay);
//	
//    // Create a plot that uses the data source method
//	CPScatterPlot *dataSourceLinePlot = [[[CPScatterPlot alloc] init] autorelease];
//    dataSourceLinePlot.identifier = @"Date Plot";
//	
//	CPMutableLineStyle *lineStyle = [[dataSourceLinePlot.dataLineStyle mutableCopy] autorelease];
//	lineStyle.lineWidth = 3.f;
//    lineStyle.lineColor = [CPColor greenColor];
//    dataSourceLinePlot.dataLineStyle = lineStyle;
//    
//    dataSourceLinePlot.dataSource = self;
//    [graph addPlot:dataSourceLinePlot];
//	
//    // Add some data
//	NSMutableArray *newData = [NSMutableArray array];
//	NSUInteger i;
//	for ( i = 0; i < 5; i++ ) {
//		NSTimeInterval x = oneDay*i;
//		id y = [NSDecimalNumber numberWithFloat:1.2*rand()/(float)RAND_MAX + 1.2];
//		[newData addObject:
//		 [NSDictionary dictionaryWithObjectsAndKeys:
//		  [NSDecimalNumber numberWithFloat:x], [NSNumber numberWithInt:CPScatterPlotFieldX], 
//		  y, [NSNumber numberWithInt:CPScatterPlotFieldY], 
//		  nil]];
//	}
//	plotData = newData;
//	
//	NSLog(@"Plot data: %@", plotData);
//	
	[batteryView setNeedsDisplay:YES];
	
	return self;
}

-(NSUInteger)numberOfRecordsForPlot:(CPPlot *)plot
{
    return plotData.count;
}

-(NSNumber *)numberForPlot:(CPPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    NSDecimalNumber *num = [[plotData objectAtIndex:index] objectForKey:[NSNumber numberWithInt:fieldEnum]];
    return num;
}


@end
