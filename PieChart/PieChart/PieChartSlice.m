//
//  PieChartSlice.m
//  PieChart
//
//  Created by Work on 6/3/15.
//  Copyright (c) 2015 Moshe. All rights reserved.
//

#import "PieChartSlice.h"

@implementation PieChartSlice

- (instancetype)initWithCenter:(CGPoint)center startAngle:(CGFloat)startAngle percentage:(CGFloat)percentage offset:(CGFloat)offset {
    self = [super init];
    
    if (self) {
        _percentage = percentage;
        _startAngle = startAngle;
        _center = center;
        _offset = offset;
    }
    
    [self updatePath];
    
    return self;
}

- (void)updatePath {
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGFloat delta = 2 * M_PI * self.percentage;
    
    CGPoint center = self.center;
    
    if (self.offset > 0) {
        BOOL isInQuadrant1 = self.startAngle >= 0 && self.startAngle < M_PI_2;
        BOOL isInQuadrant2 = self.startAngle >= M_PI_2 && self.startAngle < M_PI;
        BOOL isInQuadrant3 = self.startAngle >= M_PI && self.startAngle < 3 * M_PI / 2;
        BOOL isInQuadrant4 = self.startAngle >= 3 * M_PI / 2 && self.startAngle < 2 * M_PI;
        
        if (isInQuadrant1) {
            center = CGPointMake(self.center.x + (self.offset * cos(delta / 2)),
                                 self.center.y + (self.offset * sin(delta / 2)));
        } else if (isInQuadrant2) {
            center = CGPointMake(self.center.x - (self.offset * cos(delta / 2)),
                                 self.center.y + (self.offset * sin(delta / 2)));
        } else if (isInQuadrant3) {
            center = CGPointMake(self.center.x - (self.offset * cos(delta / 2)),
                                 self.center.y - (self.offset * sin(delta / 2)));
        } else if (isInQuadrant4) {
            center = CGPointMake(self.center.x + (self.offset * cos(delta / 2)),
                                 self.center.y - (self.offset * sin(delta / 2)));
        }


    }
    
    CGPathMoveToPoint(path, NULL, center.x, center.y);
    CGPathAddRelativeArc(path, NULL, center.x, center.y, 100, self.startAngle, delta);
    self.path = path;
}

- (CGFloat)endAngle {
    return self.startAngle + M_PI * 2 * self.percentage;
}

@end
