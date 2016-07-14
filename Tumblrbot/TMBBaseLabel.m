//
//  TMBBaseLabel.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBBaseLabel.h"

@implementation TMBBaseLabel

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.font = [TMBThemeManager themeFontDetail];
}

@end
