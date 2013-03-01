//
//  ViewController.m
//  Animations
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    
    animation.toValue = @(M_PI * 2);
    
    animation.duration = 5;
    
    animation.repeatCount = HUGE_VAL;
    
    [self.rotatingView.layer addAnimation:animation forKey:@"rotation"];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0 / -500;
    self.rotatingView.layer.transform = transform;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)runSimpleAnimation:(id)sender {
    
    UIButton* button = sender;
    
    UIView* animatedView = [[UIView alloc] initWithFrame:button.frame];
    
    animatedView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:animatedView];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        CGRect newFrame = animatedView.frame;
        newFrame.origin.y += newFrame.size.height;
        animatedView.frame = newFrame;
        
        animatedView.alpha = 0;
        
        animatedView.transform = CGAffineTransformMakeScale(0.9, 0.9);
        
    } completion:^(BOOL finished) {
        
        [animatedView removeFromSuperview];
        
    }];
    
}


- (IBAction)runKeyframeAnimation:(id)sender {
    
    [self.keyframeAnimatedView.layer removeAllAnimations];
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    NSMutableArray* positions = [[NSMutableArray alloc] init];
    
    srandomdev();
    
    [positions addObject:[NSValue valueWithCGPoint:self.keyframeAnimatedView.center]];
    
    for (int i = 0; i < 5; i++) {
        
        CGPoint point = CGPointMake(
                                    random() % (int)self.view.bounds.size.width,
                                    random() % (int)self.view.bounds.size.height);
        
        NSValue* value = [NSValue valueWithCGPoint:point];
        [positions addObject:value];
        
    }
    
    [positions addObject:[NSValue valueWithCGPoint:self.keyframeAnimatedView.center]];
    
    animation.calculationMode = kCAAnimationCubic;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.values = positions;
    
    animation.duration = 20;
    
    [self.keyframeAnimatedView.layer addAnimation:animation forKey:@"moving around a lot"];

    
    
}









@end
