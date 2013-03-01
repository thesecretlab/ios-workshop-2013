//
//  ViewController.h
//  Animations
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)runSimpleAnimation:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *rotatingView;
@property (strong, nonatomic) IBOutlet UIView *keyframeAnimatedView;
- (IBAction)runKeyframeAnimation:(id)sender;

@end
