//
//  NSDictionary+TMBDictionaryJSONParser.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "NSDictionary+TMBDictionaryJSONParser.h"
#import "NSDate+TMBDateFormatter.m"

@implementation NSDictionary (TMBDictionaryJSONParser)

- (NSString *)stringValueForKey:(NSString *)key
{
    return self[key] == [NSNull null] || ![self[key] isKindOfClass:[NSString class]] ?
    @"" : self[key];
}

- (NSNumber *)numberValueForKey:(NSString *)key
{
    return self[key] == [NSNull null] || ![self[key] isKindOfClass:[NSNumber class]] ?
    @0 : self[key];
}

- (NSDate *)dateValueForKey:(NSString *)key
{
    return self[key] == [NSNull null] || ![self[key] isKindOfClass:[NSString class]] ?
    [[NSDate alloc] init] : [NSDate dateFromString:self[key]];
}

@end
