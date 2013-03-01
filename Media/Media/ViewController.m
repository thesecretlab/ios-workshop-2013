//
//  ViewController.m
//  Media
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "AFNetworking.h"

@interface ViewController () {
    MPMoviePlayerController* _movieController;
    AVAudioPlayer* _audioPlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    NSURL* contentURL = [[NSBundle mainBundle] URLForResource:@"TestVideo" withExtension:@"m4v"];
    
    _movieController = [[MPMoviePlayerController alloc] initWithContentURL:contentURL];
    
    [self.videoContainerView addSubview:_movieController.view];
    _movieController.view.frame = self.videoContainerView.bounds;
    
    [_movieController play];
    
    AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://alpha-api.app.net/"]];
    
    [client getPath:@"stream/0/posts/stream/global"parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"We got the feed!");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"We didn't get the feed, forever tears");
        
    }];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://placekitten.com/600/300"]];
    
    AFImageRequestOperation* imageRequest = [[AFImageRequestOperation alloc] initWithRequest:request];
    
    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
    
    NSLocalizedString(@"login success", @"");
    
    [imageRequest setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        UIImage* image = responseObject;
        NSLog(@"The adorable kitten is %f x %f in size", image.size.width, image.size.height);
        
        [[AFNetworkActivityIndicatorManager sharedManager] decrementActivityCount];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    [imageRequest start];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playVideo:(id)sender {
    
    NSURL* contentURL = [[NSBundle mainBundle] URLForResource:@"TestVideo" withExtension:@"m4v"];
    
    MPMoviePlayerViewController* moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:contentURL];
    
    [self presentMoviePlayerViewControllerAnimated:moviePlayer];
    
}



- (IBAction)playSound:(id)sender {
    
    NSURL* contentURL = [[NSBundle mainBundle] URLForResource:@"TestSound" withExtension:@"wav"];
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:contentURL error:nil];
    
    [_audioPlayer play];
    
}
@end
