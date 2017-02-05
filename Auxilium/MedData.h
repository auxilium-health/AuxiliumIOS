//
//  MedData.h
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedData : UIViewController {
    UIDatePicker *myPicker;
    UIPickerView *colorPicker;
    NSMutableArray *array;
    NSDate *date;
}
@property (weak, nonatomic) IBOutlet UITextField *refillField;
@property (weak, nonatomic) IBOutlet UITextField *colorField;
@property (weak, nonatomic) IBOutlet UITextField *timesDay;
@property (weak, nonatomic) IBOutlet UITextField *medName;
@property (weak, nonatomic) IBOutlet UIButton *cancel;

- (IBAction)done:(id)sender;
@end
