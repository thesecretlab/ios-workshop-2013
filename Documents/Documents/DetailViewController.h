//
//  DetailViewController.h
//  Documents
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
