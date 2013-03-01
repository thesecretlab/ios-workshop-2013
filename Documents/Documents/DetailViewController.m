//
//  DetailViewController.m
//  Documents
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        
        NSURL* fileURL = self.detailItem;
        
        NSData* data = [NSData dataWithContentsOfURL:fileURL];
        
        NSDictionary* decodedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.titleLabel.text = [decodedData objectForKey:@"title"];
        self.textView.text = [decodedData objectForKey:@"text"];
        
        self.title = self.titleLabel.text;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
