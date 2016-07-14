//
//  NSString+TMBHTMLString.h
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TMBHTMLString)

/** turns an NSString object containing HTML tags to an NSAttributedString */
- (NSAttributedString *)convertedHTMLString;

@end
