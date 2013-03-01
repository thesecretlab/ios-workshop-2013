//
//  ViewController.m
//  GameBoard
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "ViewController.h"
#import "GamePiece.h"

@interface ViewController () {
    UIView* _containerView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 2000, 2000)];
    
    _containerView.backgroundColor = [UIColor underPageBackgroundColor];
    
    [self.scrollView addSubview:_containerView];
    [self.scrollView setContentSize:_containerView.bounds.size];
    
    srandomdev();
    
    for (int i = 0; i < 10; i++) {
        GamePiece* piece = [[GamePiece alloc] initWithFrame:CGRectZero];
        
        CGPoint center = CGPointMake(random() % (int)_containerView.bounds.size.width, random() % (int)_containerView.bounds.size.height);
        
        piece.center = center;
        
        [_containerView addSubview:piece];
    }
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _containerView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









@end
