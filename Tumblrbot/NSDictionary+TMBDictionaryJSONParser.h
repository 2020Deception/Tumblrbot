//
//  NSDictionary+TMBDictionaryJSONParser.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TMBDictionaryJSONParser)

/** returns an empty string if nil */
- (NSString *)stringValueForKey:(NSString *)key;
/** returns a freshly initialized NSDate object if nil */
- (NSDate *)dateValueForKey:(NSString *)key;
/** returns 0 if nil */
- (NSNumber *)numberValueForKey:(NSString *)key;

@end
