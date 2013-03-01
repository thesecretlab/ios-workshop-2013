//
//  DetailViewController.h
//  AppleDevices
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UITextField *deviceNameField;
@property (strong, nonatomic) IBOutlet UITextField *yearReleasedField;

@property (strong, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)takePhoto:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
