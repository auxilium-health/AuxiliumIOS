//
//  Meds.m
//  Auxilium
//
//  Created by Paran Sonthalia on 2/5/17.
//  Copyright © 2017 Mango Apps. All rights reserved.
//

#import "Meds.h"
#import "AppDelegate.h"

@interface Meds ()

@end

@implementation Meds

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    tableData = [[NSMutableArray alloc] init];
    tableData = [[defaults objectForKey:@"nameArray"] mutableCopy];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;


    // Do any additional setup after loading the view.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *color = [[defaults valueForKey:@"colorArray"] mutableCopy];
    if([color objectAtIndex:indexPath.row]) {
        if([[appDelegate.colorArray objectAtIndex:indexPath.row] isEqualToString:@"Black"] && [[tableData objectAtIndex:indexPath.row] isEqualToString:cell.textLabel.text]) {
            cell.textLabel.textColor = [UIColor blackColor];
        }
        if([[appDelegate.colorArray objectAtIndex:indexPath.row] isEqualToString:@"Brown"] && [[tableData objectAtIndex:indexPath.row] isEqualToString:cell.textLabel.text]) {
            cell.textLabel.textColor = [UIColor brownColor];
        }
        if([[appDelegate.colorArray objectAtIndex:indexPath.row] isEqualToString:@"Purple"] && [[tableData objectAtIndex:indexPath.row] isEqualToString:cell.textLabel.text]) {
            cell.textLabel.textColor = [UIColor purpleColor];
        }
        if([[appDelegate.colorArray objectAtIndex:indexPath.row] isEqualToString:@"Yellow"] && [[tableData objectAtIndex:indexPath.row] isEqualToString:cell.textLabel.text]) {
            cell.textLabel.textColor = [UIColor yellowColor];
        }
        if([[appDelegate.colorArray objectAtIndex:indexPath.row] isEqualToString:@"Green"] && [[tableData objectAtIndex:indexPath.row] isEqualToString:cell.textLabel.text]) {
            cell.textLabel.textColor = [UIColor greenColor];
        }
        if([[appDelegate.colorArray objectAtIndex:indexPath.row] isEqualToString:@"Blue"] && [[tableData objectAtIndex:indexPath.row] isEqualToString:cell.textLabel.text]) {
            cell.textLabel.textColor = [UIColor blueColor];
        }
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    [tableData removeObjectAtIndex:indexPath.row];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *time = [[defaults valueForKey:@"timesArray"] mutableCopy];
    NSMutableArray *refill = [[defaults valueForKey:@"refillArray"] mutableCopy];
    NSMutableArray *color = [[defaults valueForKey:@"colorArray"] mutableCopy];
    
    [time removeObjectAtIndex:indexPath.row];
    [refill removeObjectAtIndex:indexPath.row];
    [color removeObjectAtIndex:indexPath.row];

    
    
    [defaults setValue:tableData forKey:@"nameArray"];
    [defaults setValue:time forKey:@"timesArray"];
    [defaults setValue:refill forKey:@"refillArray"];
    [defaults setValue:color forKey:@"colorArray"];

    
    // Request table view to reload
    [tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *text = cell.textLabel.text;
    int index = -1;
    for(int x = 0; x < [tableData count]; x++) {
        if([[tableData objectAtIndex:x] isEqualToString:text]) {
            index = x;
        }
    }
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *name = [[defaults valueForKey:@"nameArray"] mutableCopy];
    NSMutableArray *time = [[defaults valueForKey:@"timesArray"] mutableCopy];
    NSMutableArray *color = [[defaults valueForKey:@"colorArray"] mutableCopy];
    NSMutableArray *refill = [[defaults valueForKey:@"refillArray"] mutableCopy];
    
    appDelegate.medName = [name objectAtIndex:index];
    appDelegate.weekTime = [time objectAtIndex:index];
    appDelegate.color = [color objectAtIndex:index];
    appDelegate.refill = [refill objectAtIndex:index];
    
    appDelegate.screen = false;
    
    [tableData removeObjectAtIndex:indexPath.row];
    [time removeObjectAtIndex:indexPath.row];
    [refill removeObjectAtIndex:indexPath.row];
    [color removeObjectAtIndex:indexPath.row];
    
    [defaults setValue:tableData forKey:@"nameArray"];
    [defaults setValue:time forKey:@"timesArray"];
    [defaults setValue:refill forKey:@"refillArray"];
    [defaults setValue:color forKey:@"colorArray"];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"medData"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"home"];
    
    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:vc animated:YES completion:NULL];
}
@end
