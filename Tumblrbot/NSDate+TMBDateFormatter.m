//
//  NSDate+TMBDateFormatter.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "NSDate+TMBDateFormatter.h"

@implementation NSDate (TMBDateFormatter)

+ (NSDate *)dateFromString:(NSString *)string
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    f.dateFormat = @"yyyy-MM-dd HH:mm:ssz";
    return [f dateFromString:string];
}

@end
