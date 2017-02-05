//
//  MyInfo.h
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfo : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *pharmacy;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (weak, nonatomic) IBOutlet UITextField *docName;
@property (weak, nonatomic) IBOutlet UITextField *docPhone;

- (IBAction)save:(id)sender;
- (IBAction)back:(id)sender;
- (IBAction)phone:(id)sender;
- (IBAction)location:(id)sender;

@end
