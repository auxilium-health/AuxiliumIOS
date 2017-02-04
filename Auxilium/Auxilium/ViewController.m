//
//  ViewController.m
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import "ViewController.h"
#import "MaterialButtons.h"


@interface ViewController ()

@end

@implementation ViewController

//@synthesize clock;

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self
                                                      selector: @selector(reloadClock) userInfo: nil repeats: YES];
    
    
    
    
}

- (void) addMed {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"addMed"];
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
