;//
//  GamePiece.m
//  GameBoard
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "GamePiece.h"

@implementation GamePiece

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        frame.size = CGSizeMake(100, 100);
        self.frame = frame;
        
        self.backgroundColor = [UIColor clearColor];
        
        UIPanGestureRecognizer* drag = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(drag:)];
        
        [self addGestureRecognizer:drag];
    }
    return self;
}

- (void) drag:(UIPanGestureRecognizer*)pan {
    if (pan.state == UIGestureRecognizerStateChanged) {
        
        CGPoint translation = [pan translationInView:pan.view];
        
        translation.x += self.center.x;
        translation.y += self.center.y;
        
        self.center = translation;
        
        [pan setTranslation:CGPointZero inView:pan.view];
        
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    CGRect pathRect = CGRectInset(self.bounds, 1, 1);
    
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:pathRect];
    
    [[UIColor blackColor] setStroke];
    [[[UIColor redColor] colorWithAlphaComponent:0.5] setFill];
    
    [path fill];
    [path stroke];
    
}


@end
