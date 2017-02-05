//
//  AppDelegate.h
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (nonatomic, retain) NSString *medName;
@property (nonatomic, retain) NSString *weekTime;
@property (nonatomic, retain) NSString *color;
@property (nonatomic, retain) NSDate *refill;

@property (nonatomic, retain) NSMutableArray *nameArray;
@property (nonatomic, retain) NSMutableArray *timesArray;
@property (nonatomic, retain) NSMutableArray *colorArray;
@property (nonatomic, retain) NSMutableArray *refillArray;

@property (nonatomic, retain) NSString *pharmacy;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *docName;
@property (nonatomic, retain) NSString *docPhone;

- (void)saveContext;


@end

