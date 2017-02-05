//
//  ViewController.m
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import "ViewController.h"
#import "MaterialButtons.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    appDelegate.nameArray = [defaults valueForKey:@"nameArray"];
    appDelegate.timesArray = [defaults valueForKey:@"timesArray"];
    appDelegate.colorArray = [defaults valueForKey:@"colorArray"];
    appDelegate.refillArray = [defaults valueForKey:@"refillArray"];
    
    if(appDelegate.nameArray == 0) {
        appDelegate.nameArray = [[NSMutableArray alloc] init];
        appDelegate.timesArray = [[NSMutableArray alloc] init];
        appDelegate.colorArray = [[NSMutableArray alloc] init];
        appDelegate.refillArray = [[NSMutableArray alloc] init];
        
        [[NSUserDefaults standardUserDefaults] setValue:appDelegate.nameArray forKey:@"nameArray"];
        [[NSUserDefaults standardUserDefaults] setValue:appDelegate.timesArray forKey:@"timesArray"];
        [[NSUserDefaults standardUserDefaults] setValue:appDelegate.colorArray forKey:@"colorArray"];
        [[NSUserDefaults standardUserDefaults] setValue:appDelegate.refillArray forKey:@"refillArray"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];

    }
    appDelegate.nameArray = [[defaults valueForKey:@"nameArray"] mutableCopy];
    appDelegate.timesArray = [[defaults valueForKey:@"timesArray"] mutableCopy];
    appDelegate.colorArray = [[defaults valueForKey:@"colorArray"] mutableCopy];
    appDelegate.refillArray = [[defaults valueForKey:@"refillArray"] mutableCopy];

//    if(appDelegate.medName != nil) {
//        [appDelegate.nameArray addObject:appDelegate.medName];
//        [appDelegate.timesArray addObject:appDelegate.weekTime];
//        [appDelegate.colorArray addObject:appDelegate.color];
//        [appDelegate.refillArray addObject:appDelegate.refill];
//
//    }
    [[NSUserDefaults standardUserDefaults] setValue:appDelegate.nameArray forKey:@"nameArray"];
    [[NSUserDefaults standardUserDefaults] setValue:appDelegate.timesArray forKey:@"timesArray"];
    [[NSUserDefaults standardUserDefaults] setValue:appDelegate.colorArray forKey:@"colorArray"];
    [[NSUserDefaults standardUserDefaults] setValue:appDelegate.refillArray forKey:@"refillArray"];

    [[NSUserDefaults standardUserDefaults] synchronize];
    
    myClock = [[BEMAnalogClockView alloc] initWithFrame:CGRectMake(self.view.center.x - 150, self.view.center.y - 150, 300, 300)];
    myClock.delegate = self;
    myClock.hours = 7;
    myClock.minutes = 37;
    myClock.seconds = 10;
    myClock.currentTime = YES;
    myClock.enableGraduations = false;
    myClock.secondHandAlpha = 0;
    myClock.minuteHandLength = 100;
    myClock.minuteHandAlpha = 0;
    myClock.hourHandLength = 100;
    myClock.faceBackgroundColor = [UIColor redColor];
    
    MDCFloatingButton *raisedButton = [MDCFloatingButton new];
    [raisedButton setTitle:@"+" forState:UIControlStateNormal];
    raisedButton.titleLabel.font = [UIFont systemFontOfSize:30];
    raisedButton.frame = CGRectMake(self.view.frame.size.width/2 + self.view.frame.size.width/4, self.view.frame.size.height/2 + self.view.frame.size.height/4 , 50, 50);
    [raisedButton sizeToFit];
    [raisedButton addTarget:self
                     action:@selector(addMed)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:raisedButton];
    
    [self.view addSubview:myClock];
    
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval: 60.0 target: self
                                                      selector: @selector(reloadClock) userInfo: nil repeats: YES];
    
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    double time = 8.0;
    
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.view.center.x + (150 * -sin((2*3.14*time)/24)), self.view.center.y + (150 * -cos((2*3.14*time)/24)), 20, 20)] CGPath]];
    
    
    for(int x = 0; x < [appDelegate.nameArray count]; x++) {
        if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Black"]) {
            [circleLayer setFillColor:[[UIColor blackColor] CGColor]];
        }
        if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Brown"]) {
            [circleLayer setFillColor:[[UIColor brownColor] CGColor]];
        }
        if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Purple"]) {
            [circleLayer setFillColor:[[UIColor purpleColor] CGColor]];
        }
        if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Yellow"]) {
            [circleLayer setFillColor:[[UIColor yellowColor] CGColor]];
        }
        if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Green"]) {
            [circleLayer setFillColor:[[UIColor greenColor] CGColor]];
        }
        if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Blue"]) {
            [circleLayer setFillColor:[[UIColor blueColor] CGColor]];
        }
        [[self.view layer] addSublayer:circleLayer];

    }
}

- (void) addMed {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"addMed"];
//    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"medData"];

    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (void) reloadClock {
    [myClock reloadClock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
