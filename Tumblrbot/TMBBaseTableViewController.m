//
//  TMBBaseTableViewController.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/17/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBBaseTableViewController.h"

@interface TMBBaseTableViewController ()

@end

@implementation TMBBaseTableViewController

+ (instancetype)controllerWithStoryboardIdentifier:(NSString *)storyboardIdentifier
{
    TMBBaseTableViewController *controller;
    
    if (storyboardIdentifier != nil) {
        controller = [[UIStoryboard storyboardWithName:kStoryBoard bundle:nil]
                      instantiateViewControllerWithIdentifier:storyboardIdentifier];
    } else {
        controller = [[TMBBaseTableViewController alloc] init];
    }
    
    return controller;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

@end
