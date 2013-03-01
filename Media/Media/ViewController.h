//
//  ViewController.h
//  Media
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)playVideo:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *videoContainerView;
- (IBAction)playSound:(id)sender;

@end
