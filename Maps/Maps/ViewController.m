//
//  ViewController.m
//  Maps
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate> {
    
    CLLocationManager* _locationManager;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(-33.859972, 151.21111);
    
    MKCircle* circle = [MKCircle circleWithCenterCoordinate:coordinate radius:1000];
    
    [self.mapView addOverlay:circle];
    
    _locationManager = [[CLLocationManager alloc] init];
    
    _locationManager.delegate = self;
    
    _locationManager.distanceFilter = 100;
    
    _locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    [_locationManager startUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation* location = locations[0];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(-33.859972, 151.21111);
    
    CLRegion* region = [[CLRegion alloc] initCircularRegionWithCenter:coordinate radius:1000 identifier:@"City"];
    
    if ([region containsCoordinate:location.coordinate]) {
        NSLog(@"The user is in the city.");
    } else {
        NSLog(@"The user is not in the city.");
    }
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    
    if ([overlay isKindOfClass:[MKCircle class]]) {
        
        MKCircle* circle = overlay;
        
        MKCircleView* circleView = [[MKCircleView alloc] initWithCircle:circle];
        
        circleView.strokeColor = [UIColor blueColor];
        circleView.fillColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
        
        return circleView;
        
    }
    
    return nil;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
