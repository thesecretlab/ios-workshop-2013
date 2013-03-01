//
//  ViewController.m
//  WebsiteIcons
//
//  Created by Jon Manning on 22/02/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray* websites;
    NSMutableArray* websiteIcons;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    websites = @[@"google.com", @"amazon.com", @"microsoft.com", @"daringfireball.net", @"apple.com"];
    
    websiteIcons = [[NSMutableArray alloc] init];
    
    for (NSString* website in websites) {
        [websiteIcons addObject:[NSNull null]];
    }

    NSOperationQueue* backgroundQueue = [[NSOperationQueue alloc] init];

    int websiteNumber = 0;

    for (NSString* website in websites) {
        
        [backgroundQueue addOperationWithBlock:^{
            
            NSURL* iconURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@/favicon.ico", website]];
            
            NSURLRequest* request = [NSURLRequest requestWithURL:iconURL];
            
            NSData* loadedData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            
            if (loadedData != nil) {
                
                UIImage* loadedImage = [UIImage imageWithData:loadedData];
                
                if (loadedImage == nil)
                    return;
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [websiteIcons replaceObjectAtIndex:websiteNumber withObject:loadedImage];
                    [self.tableView reloadData];
                }];
            }
        }];
        
        websiteNumber++;
        
    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [websiteIcons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"IconCell"];
    
    NSString* websiteName = websites[indexPath.row];
    
    cell.textLabel.text = websiteName;
    
    
    
    UIImage* websiteImage = [websiteIcons objectAtIndex:indexPath.row];
    
    if ((id)websiteImage != [NSNull null]) {
        cell.imageView.image = websiteImage;
        
    }
    
    return cell;
    
}








@end
