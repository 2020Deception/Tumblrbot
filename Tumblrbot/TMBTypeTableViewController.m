//
//  TMBTypeTableViewController.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/14/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBTypeTableViewController.h"
#import "TMBTypeTableViewDataSource.h"
#import "TMBDashboardTableViewController.h"

@interface TMBTypeTableViewController ()

@property (nonatomic) TMBTypeTableViewDataSource *dataSource;

@end

@implementation TMBTypeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataSource = [[TMBTypeTableViewDataSource alloc] init];
    self.tableView.dataSource = self.dataSource;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMBDashboardTableViewController *c = [TMBDashboardTableViewController
                                          controllerWithFetchType:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    [self.navigationController pushViewController:c animated:YES];
}

@end
