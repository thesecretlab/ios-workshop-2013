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
