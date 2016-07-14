//
//  TMBBaseTextView.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBBaseTextView.h"

@implementation TMBBaseTextView

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollEnabled = YES;
}

@end
