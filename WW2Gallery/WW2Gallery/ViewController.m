//
//  ViewController.m
//  WW2Gallery
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int imageCount = 21;
    
    [self loadImagesForPage:0 maximumPages:21*4];
    
    self.imagesContainer.contentSize = CGSizeMake(self.view.bounds.size.width*imageCount*4, self.view.bounds.size.height);
    
}

- (void) loadImagesForPage:(NSInteger)page maximumPages:(NSInteger)maximumPages {
    
    page += 1;
    
    if (page - 1 >= 0) {
        [self loadImage:page-1];
    }
    
    [self loadImage:page];
    
    if (page + 1 < maximumPages) {
        [self loadImage:page+1];
    }
    
    for (UIView* view in self.imagesContainer.subviews) {
        NSInteger tag = view.tag;
        if (tag < page - 1 || tag > page +1)
            [view removeFromSuperview];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = (int)(scrollView.contentOffset.x / scrollView.bounds.size.width);
    
    [self loadImagesForPage:page maximumPages:21 * 4];
}

- (void) loadImage:(NSInteger)imageNumber {
    
    int totalImages = 21;
    
    if ([self.imagesContainer viewWithTag:imageNumber])
        return;
    
    NSString* imageName = [NSString stringWithFormat:@"poster-%i", imageNumber%totalImages+1];
    
    NSString* imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    
    UIImage* image = [UIImage imageWithContentsOfFile:imagePath];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    
    CGRect imageViewFrame = self.view.bounds;
    imageViewFrame.origin.x = self.view.bounds.size.width * (imageNumber - 1);
    imageView.frame = imageViewFrame;
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    imageView.tag = imageNumber;
    
    [self.imagesContainer addSubview:imageView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
