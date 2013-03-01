//
//  ViewController.h
//  Maps
//
//  Created by Jonathon Manning on 23/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
