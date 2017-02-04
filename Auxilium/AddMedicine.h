//
//  AddMedicine.h
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TesseractOCR/TesseractOCR.h>


@interface AddMedicine : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, G8TesseractDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:  (UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender;

@end
