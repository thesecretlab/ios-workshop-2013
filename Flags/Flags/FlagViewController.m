//
//  FlagViewController.m
//  Flags
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import "FlagViewController.h"

@interface FlagViewController ()

@end

@implementation FlagViewController

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
    
    self.flagImage.image = [UIImage imageNamed:self.selectedFlag];
    self.flagName.text = [[self.selectedFlag stringByDeletingPathExtension] capitalizedString];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
