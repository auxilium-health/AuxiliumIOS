//
//  ViewController.h
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMAnalogClockView.h"


@interface ViewController : UIViewController <BEMAnalogClockDelegate> {
    BEMAnalogClockView *myClock;
}

@end

