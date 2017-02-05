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
    myClock.hourHandColor = [UIColor whiteColor];
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
    
    
    MDCFloatingButton *raisedButton2 = [MDCFloatingButton new];
    [raisedButton2 setTitle:@"Meds" forState:UIControlStateNormal];
    raisedButton2.titleLabel.font = [UIFont systemFontOfSize:8];
    raisedButton2.frame = CGRectMake(self.view.frame.size.width/2 + self.view.frame.size.width/4, self.view.frame.size.height/2 - 2.5*self.view.frame.size.height/8 , 50, 50);
    [raisedButton2 sizeToFit];
    [raisedButton2 addTarget:self
                     action:@selector(addMed2)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:raisedButton2];
    
    
    MDCFloatingButton *raisedButton3 = [MDCFloatingButton new];
    [raisedButton3 setTitle:@"Info" forState:UIControlStateNormal];
    raisedButton3.titleLabel.font = [UIFont systemFontOfSize:8];
    raisedButton3.frame = CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width/4 - 50, self.view.frame.size.height/2 - 2.5*self.view.frame.size.height/8 , 50, 50);
    [raisedButton3 sizeToFit];
    [raisedButton3 addTarget:self
                      action:@selector(addMed3)
            forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:raisedButton3];
    
    
    
    [self.view addSubview:myClock];
    
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval: 60.0 target: self
                                                      selector: @selector(reloadClock) userInfo: nil repeats: YES];
    
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    CAShapeLayer *circleLayer2 = [CAShapeLayer layer];
    CAShapeLayer *circleLayer3 = [CAShapeLayer layer];

    double time = 8.0;
    double time2 = 16.0;
    
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.view.center.x + (150 * -sin((2*3.14*time)/24)), self.view.center.y + (150 * -cos((2*3.14*time)/24)), 20, 20)] CGPath]];
     [circleLayer2 setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.view.center.x + (150 * -sin((2*3.14*time)/24)) - 23, self.view.center.y + (150 * -cos((2*3.14*time)/24)), 20, 20)] CGPath]];
    [circleLayer3 setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.view.center.x + (134 * -sin((2*3.14*time2)/24)), self.view.center.y + (134 * -cos((2*3.14*time2)/24)), 20, 20)] CGPath]];
    
    if([appDelegate.colorArray count] > 0) {
        for(int x = 0; x < 1; x++) {
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
        for(int x = 0; x < 1; x++) {
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Black"]) {
                [circleLayer3 setFillColor:[[UIColor blackColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Brown"]) {
                [circleLayer3 setFillColor:[[UIColor brownColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Purple"]) {
                [circleLayer3 setFillColor:[[UIColor purpleColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Yellow"]) {
                [circleLayer3 setFillColor:[[UIColor yellowColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Green"]) {
                [circleLayer3 setFillColor:[[UIColor greenColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Blue"]) {
                [circleLayer3 setFillColor:[[UIColor blueColor] CGColor]];
            }
            [[self.view layer] addSublayer:circleLayer3];
        }
    }
    if([appDelegate.colorArray count] > 1) {
        for(int x = 1; x < 2; x++) {
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Black"]) {
                [circleLayer2 setFillColor:[[UIColor blackColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Brown"]) {
                [circleLayer2 setFillColor:[[UIColor brownColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Purple"]) {
                [circleLayer2 setFillColor:[[UIColor purpleColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Yellow"]) {
                [circleLayer2 setFillColor:[[UIColor yellowColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Green"]) {
                [circleLayer2 setFillColor:[[UIColor greenColor] CGColor]];
            }
            if([[appDelegate.colorArray objectAtIndex:x] isEqualToString:@"Blue"]) {
                [circleLayer2 setFillColor:[[UIColor blueColor] CGColor]];
            }
            [[self.view layer] addSublayer:circleLayer2];
        }
    }
    
}

- (void) addMed {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"addMed"];

    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}
- (void) addMed2 {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"meds"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}
- (void) addMed3 {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"info"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (void) reloadClock {
    [myClock reloadClock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
