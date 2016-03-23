//
//  LeftSideMenuViewController.m
//  iOSSamples
//
//  Created by Joohae Kim on 2016. 3. 12..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "LeftSideMenuViewController.h"

#import <SNSServices/SNSServiceManager.h>

#define kLeftSideMenuSNSServices @"LEFT_MENU_SNSCELL"
#define kLeftSideMenuDefaluItems @"LEFT_MENU_DEFAULTCELL"

@interface LeftSideMenuViewController ()

@end

@implementation LeftSideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return SNSServiceManager.numberOfServices;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    if (indexPath.row < SNSServiceManager.numberOfServices) {
        cell = [tableView dequeueReusableCellWithIdentifier:kLeftSideMenuSNSServices forIndexPath:indexPath];
        
        NSDictionary *snsService = [SNSServiceManager getServiceAt:indexPath.row];
        [cell.textLabel setText:snsService[SNSServiceTitle]];
        [cell.detailTextLabel setText:snsService[SNSServiceDescription]];
        [cell.imageView setImage:[UIImage imageNamed:snsService[SNSServiceIcon]]];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:kLeftSideMenuDefaluItems forIndexPath:indexPath];
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
