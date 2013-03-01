//
//  ViewController.h
//  HelloWorld
//
//  Created by Jon Manning on 22/02/13.
//  Copyright (c) 2013 Secret Lab. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

- (void) goToTheMoon;
- (int) distanceToTheMoon;


- (void) purchaseRocket:(int)price;
- (void) purchaseRocket:(int)price shouldReenterAtmosphere:(BOOL)reenter;

@property (assign) int amountOfFuel;

@property (weak) NSObject* bob;


@end












