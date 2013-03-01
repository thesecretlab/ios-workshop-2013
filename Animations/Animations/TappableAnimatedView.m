//
//  TappableAnimatedView.m
//  Animations
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "TappableAnimatedView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TappableAnimatedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [self addGestureRecognizer:tap];
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowRadius = 5;
    self.layer.shadowOffset = CGSizeMake(0, 5);
    self.layer.shadowOpacity = 1.0;
    
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 2;
    
    
}

- (void) tap:(UITapGestureRecognizer*)tap {
    if (tap.state == UIGestureRecognizerStateRecognized) {
        CGFloat red = (random() % 1000) / 1000.0;
        CGFloat green = (random() % 1000) / 1000.0;
        CGFloat blue = (random() % 1000) / 1000.0;
        
        self.backgroundColor = [UIColor colorWithRed:red
                                               green:green
                                                blue:blue
                                               alpha:1.0];
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGPoint convertedPoint = [self.layer.presentationLayer convertPoint:point fromLayer:self.layer.modelLayer];
    
    return [self.layer.presentationLayer containsPoint:convertedPoint];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
