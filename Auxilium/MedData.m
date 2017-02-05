//
//  MedData.m
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import "MedData.h"
#import "AppDelegate.h"

@interface MedData ()

@end

@implementation MedData


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _medName.text = appDelegate.medName;
    _timesDay.text = appDelegate.weekTime;
    _colorField.text = appDelegate.color;
    
    if(appDelegate.refill != nil) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        // get NSDate from old string format
        [dateFormatter setDateFormat:@"MM-dd-yyyy"];
        date = appDelegate.refill;
        
        // get string in new date format
        [dateFormatter setDateFormat:@"MM-dd-yyyy"];
        NSString *strMyDate= [dateFormatter stringFromDate:date];
        
        _refillField.text = [NSString stringWithFormat:@"%@",strMyDate];
    }
    
    
    
    CGRect pickerFrame = CGRectMake(0,250,0,0);
    
    myPicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    myPicker.contentMode = UIDatePickerModeDate;
    [myPicker addTarget:self action:@selector(pickerChanged) forControlEvents:UIControlEventValueChanged];
    _refillField.inputView = myPicker;

    
    colorPicker = [[UIPickerView alloc] initWithFrame:pickerFrame];
    colorPicker.delegate = self;
    colorPicker.dataSource = self;
    
    array = [NSMutableArray arrayWithObjects: @"Blue", @"Green", @"Yellow", @"Purple", @"Brown", @"Black", nil];
    _colorField.inputView = colorPicker;

    

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)colorPicker numberOfRowsInComponent:(NSInteger)component{
    
    return array.count;
    
}
- (NSString *)pickerView:(UIPickerView *)colorPicker titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return array[row];
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _colorField.text = [array objectAtIndex:row];
}


-(void) pickerChanged {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // get NSDate from old string format
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    date = myPicker.date;
    
    // get string in new date format
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    NSString *strMyDate= [dateFormatter stringFromDate:date];
    
    _refillField.text = [NSString stringWithFormat:@"%@",strMyDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancel:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"home"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction)done:(id)sender {
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    appDelegate.nameArray = [[defaults valueForKey:@"nameArray"] mutableCopy];
    appDelegate.timesArray = [[defaults valueForKey:@"timesArray"] mutableCopy];
    appDelegate.colorArray = [[defaults valueForKey:@"colorArray"] mutableCopy];
    appDelegate.refillArray = [[defaults valueForKey:@"refillArray"] mutableCopy];
    
    [appDelegate.nameArray addObject:_medName.text];
    [appDelegate.timesArray addObject:_timesDay.text];
    [appDelegate.colorArray addObject:_colorField.text];
    [appDelegate.refillArray addObject:date];
    
    [[NSUserDefaults standardUserDefaults] setValue:appDelegate.nameArray forKey:@"nameArray"];
    [[NSUserDefaults standardUserDefaults] setValue:appDelegate.timesArray forKey:@"timesArray"];
    [[NSUserDefaults standardUserDefaults] setValue:appDelegate.colorArray forKey:@"colorArray"];
    [[NSUserDefaults standardUserDefaults] setValue:appDelegate.refillArray forKey:@"refillArray"];

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"home"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}
@end
