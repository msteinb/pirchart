//
//  ViewController.m
//  PieChart
//
//  Created by Work on 6/9/15.
//  Copyright (c) 2015 Moshe. All rights reserved.
//

#import "ViewController.h"

#import "PieChart.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGPoint center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    
    PieChart *pieChart = [[PieChart alloc] initWithFrame:NSMakeRect(center.x, center.y, 300, 300)];
    [self.view addSubview:pieChart];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
