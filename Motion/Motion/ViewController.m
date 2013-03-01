//
//  ViewController.m
//  Motion
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController () {
    CMMotionManager* _motionManager;
}

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    _motionManager = [[CMMotionManager alloc] init];

    [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        
        
        CMAttitude* attitude = [motion attitude];
        CMAcceleration acceleration = [motion userAcceleration];
        
        CGAffineTransform viewTransform = CGAffineTransformMakeRotation(-attitude.roll);
        
        viewTransform = CGAffineTransformTranslate(viewTransform, -acceleration.x * 100, -acceleration.y * 100);
        
        self.motionView.transform = viewTransform;
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
