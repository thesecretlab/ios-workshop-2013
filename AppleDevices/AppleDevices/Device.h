//
//  Device.h
//  AppleDevices
//
//  Created by Jonathon Manning on 24/02/13.
//  Copyright (c) 2013 Jonathon Manning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Device : NSManagedObject

@property (nonatomic, retain) NSString * deviceName;
@property (nonatomic, retain) NSNumber * released;
@property (nonatomic, retain) NSData * photo;

@end
