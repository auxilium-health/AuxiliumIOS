//
//  AddMedicine.m
//  Auxilium
//
//  Created by Paran Sonthalia on 2/4/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import "AddMedicine.h"
#import "AppDelegate.h"

@interface AddMedicine ()

@end

@implementation AddMedicine

@synthesize imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    photo = false;
    
}

- (void) viewDidAppear:(BOOL)animated {
    if(photo == false) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
//        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        [self presentModalViewController:picker animated:YES];
    }
    photo = true;

}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.imageView setImage:image];
    
    [self dismissModalViewControllerAnimated:YES];
    
    [self runRecognition];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) runRecognition {
    // Create RecognitionOperation
    G8RecognitionOperation *operation = [[G8RecognitionOperation alloc] initWithLanguage:@"eng+ita"];
    
    // Configure inner G8Tesseract object as described before
//    operation.tesseract.language = @"eng";
    //    operation.tesseract.charWhitelist = @"01234567890";
    operation.tesseract.image = [image g8_blackAndWhite];
    
    // Setup the recognitionCompleteBlock to receive the Tesseract object
    // after text recognition. It will hold the recognized text.
    operation.recognitionCompleteBlock = ^(G8Tesseract *recognizedTesseract) {
        // Retrieve the recognized text upon completion
        NSLog(@"%@", [recognizedTesseract recognizedText]);
        
        int index = 0;
//        int index2 = 0;
//        
//        for (int i=0;i<[[recognizedTesseract recognizedText] length];i++)
//        {
//            if ([[recognizedTesseract recognizedText] characterAtIndex:i]=='-' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='0')
//            {
//                index = i;
//                break;
//            }
//        }
//        for (int i=0;i<[[recognizedTesseract recognizedText] length];i++)
//        {
//            if ([[recognizedTesseract recognizedText] characterAtIndex:i]=='0' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='1' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='2' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='0' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='3' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='4' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='5' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='6' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='7' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='8' || [[recognizedTesseract recognizedText] characterAtIndex:i]=='9')
//            {
//                index2 = i;
//                break;
//            }
//        }
        int number = 0;
        for (int i=0;i<[[recognizedTesseract recognizedText] length];i++)
        {
            if([[recognizedTesseract recognizedText] rangeOfString:@"ONCE"].location != NSNotFound) {
                number = 1;
                break;
            }
            if([[recognizedTesseract recognizedText] rangeOfString:@"TWICE"].location != NSNotFound) {
                number = 2;
                break;
            }
            if([[recognizedTesseract recognizedText] rangeOfString:@"THRICE"].location != NSNotFound) {
                number = 3;
                break;
            }
        }
        
        NSArray *vals = [[recognizedTesseract recognizedText] componentsSeparatedByString:@"\n"];
        NSString *text = [vals objectAtIndex:2];
        for (int i=0;i<[text length];i++)
        {
            if ([text characterAtIndex:i]=='0' || [text characterAtIndex:i]=='1' || [text characterAtIndex:i]=='2' || [text characterAtIndex:i]=='3' || [text characterAtIndex:i]=='4' || [text characterAtIndex:i]=='5' || [text characterAtIndex:i]=='6' || [text characterAtIndex:i]=='7' || [text characterAtIndex:i]=='8' || [text characterAtIndex:i]=='9')
            {
                index = i;
                break;
            }
        }
        
//        NSRange range = [[recognizedTesseract recognizedText] rangeOfString:@"-"];
        NSString *substring = [text substringWithRange:NSMakeRange(0, index-1)];
        NSLog(@"%@", substring);
        NSLog(@"%@", [NSString stringWithFormat:@"%d", number]);
        
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        appDelegate.medName = substring;
        appDelegate.weekTime = [NSString stringWithFormat:@"%d", number];
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"medData"];
        
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:vc animated:YES completion:NULL];

    };
    
    
    
    

    
    
    // Add operation to queue
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}


@end
