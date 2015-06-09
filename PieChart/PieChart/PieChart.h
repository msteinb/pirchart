//
//  PieChart.h
//  PieChart
//
//  Created by Work on 6/3/15.
//  Copyright (c) 2015 Moshe. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class PieChartSlice;

@interface PieChart : NSView

- (void)addSlice:(PieChartSlice *)slice;

@end
