//
//  Meds.h
//  Auxilium
//
//  Created by Paran Sonthalia on 2/5/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Meds : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *tableData;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
- (IBAction)back:(id)sender;

@end
