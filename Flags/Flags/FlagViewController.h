//
//  FlagViewController.h
//  Flags
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlagViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *flagImage;
@property (strong, nonatomic) IBOutlet UILabel *flagName;

@property (strong, nonatomic) NSString* selectedFlag;

@end
