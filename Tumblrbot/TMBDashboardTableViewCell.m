//
//  TMBDashboardTableViewCell.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/6/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBDashboardTableViewCell.h"

@implementation TMBDashboardTableViewCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textLabel.font = [TMBThemeManager themeFontDetail];
    self.detailTextLabel.font = [TMBThemeManager themeFontSmall];
}

@end
