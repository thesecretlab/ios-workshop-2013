//
//  ViewController.h
//  Flags
//
//  Created by Jon Manning on 22/02/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *flagsList;
@property (strong, nonatomic) IBOutlet UIImageView *flagImage;
@property (strong, nonatomic) IBOutlet UILabel *flagName;

@end
