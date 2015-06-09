//
//  PieChartSlice.h
//  PieChart
//
//  Created by Work on 6/3/15.
//  Copyright (c) 2015 Moshe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface PieChartSlice : CAShapeLayer

@property (nonatomic, readonly) CGFloat percentage;
@property (nonatomic, readonly) CGFloat startAngle;
@property (nonatomic, readonly) CGFloat endAngle;
@property (nonatomic, readonly) CGPoint center;
@property (nonatomic, readonly) CGFloat offset;
@property (nonatomic) NSString *label;

- (instancetype)initWithCenter:(CGPoint)center startAngle:(CGFloat)startAngle percentage:(CGFloat)percentage offset:(CGFloat)offset;

@end
