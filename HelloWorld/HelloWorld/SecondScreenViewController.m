//
//  SecondScreenViewController.m
//  HelloWorld
//
//  Created by Jon Manning on 22/02/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import "SecondScreenViewController.h"

@interface SecondScreenViewController ()

@end

@implementation SecondScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doSomething:(id)sender {
    [UIView animateWithDuration:0.25 animations:^{
        self.view.backgroundColor = [UIColor yellowColor];
    }];
    
}

@end











