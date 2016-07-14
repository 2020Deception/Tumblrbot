//
//  TMBTypeTableViewDataSource.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/14/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBTypeTableViewDataSource.h"
#import "TMBDashboardTableViewCell.h"

@implementation TMBTypeTableViewDataSource

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self cellNames].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TMBDashboardTableViewCell *cell = [[TMBDashboardTableViewCell alloc] init];
    cell.textLabel.text = [self cellNames][indexPath.row];
    return cell;
}


- (NSArray<NSString *>*)cellNames
{
    static NSArray *names;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        names = @[@"text", @"quote", @"link", @"answer", @"video", @"photo", @"chat", @"audio", @"all"];
    });
    return names;
}

@end
