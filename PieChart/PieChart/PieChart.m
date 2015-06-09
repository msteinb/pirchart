//
//  PieChart.m
//  PieChart
//
//  Created by Work on 6/3/15.
//  Copyright (c) 2015 Moshe. All rights reserved.
//

#import "PieChart.h"
#import <QuartzCore/QuartzCore.h>

#import "PieChartSlice.h"

@interface PieChart ()
@property (nonatomic, readonly) CGPoint center;
@property (nonatomic, readonly) CGFloat radius;
@property (nonatomic) NSArray *percentages;
@property (nonatomic) NSArray *colors;

@property (nonatomic) CGFloat lastEndAngle;
@end

@implementation PieChart

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    
    if (self) {
        self.percentages = @[@0.3, @0.2, @0.4, @0.1];
        
        self.colors = @[[NSColor blueColor],
                        [NSColor orangeColor],
                        [NSColor redColor],
                        [NSColor purpleColor]];
        
        self.wantsLayer = YES;
        
        [self.percentages enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            PieChartSlice *slice = [[PieChartSlice alloc] initWithCenter:self.center
                                                              startAngle:self.lastEndAngle
                                                              percentage:[obj floatValue]
                                                                  offset:2];
            slice.fillColor = [self.colors[idx] CGColor];
            [self addSlice:slice];
        }];
    }
    
    return self;
}

- (void)addSlice:(PieChartSlice *)slice {
    [self.layer addSublayer:slice];
    self.lastEndAngle = slice.endAngle;
}

- (CGPoint)center {
    return CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
}

- (CGFloat)radius {
    return self.bounds.size.width / 2;
}

@end
