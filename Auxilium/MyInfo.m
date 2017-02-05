//
//  MyInfo.m
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import "MyInfo.h"
#import "AppDelegate.h"

@interface MyInfo ()

@end

@implementation MyInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    
    _pharmacy.text = [defaults valueForKey:@"pharmacy"];
    _location.text = [defaults valueForKey:@"location"];
    _docName.text = [defaults valueForKey:@"docName"];
    _docPhone.text = [defaults valueForKey:@"docPhone"];

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setValue:_pharmacy.text forKey:@"pharmacy"];
    [defaults setValue:_location.text forKey:@"location"];
    [defaults setValue:_docName.text forKey:@"docName"];
    [defaults setValue:_docPhone.text forKey:@"docPhone"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)phone:(id)sender {
    NSString *phoneNum = [@"tel:" stringByAppendingString:_docPhone.text];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum] options:@{} completionHandler:nil];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNum]];
}

- (IBAction)location:(id)sender {
    
}
@end
