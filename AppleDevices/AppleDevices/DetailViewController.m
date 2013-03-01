//
//  DetailViewController.m
//  AppleDevices
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "DetailViewController.h"

#import "Device.h"

@interface DetailViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
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
        
        Device* device = self.detailItem;
        
        self.deviceNameField.text = device.deviceName;
        self.yearReleasedField.text = [device.released description];
        
        self.photoView.image = [UIImage imageWithData:device.photo];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    Device* device = self.detailItem;
    
    device.deviceName = self.deviceNameField.text;
    device.released = @(self.yearReleasedField.text.integerValue);
    
    NSError* error = nil;
    
    [[device managedObjectContext] save:&error];
    
    
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

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            
            imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            
        }
        
    }
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:imagePicker animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage* image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.photoView.image = image;
    
    Device* device = self.detailItem;
    
    device.photo = UIImageJPEGRepresentation(image, 0.8);
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}







@end
