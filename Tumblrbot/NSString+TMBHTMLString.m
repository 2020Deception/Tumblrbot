//
//  NSString+TMBHTMLString.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/15/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "NSString+TMBHTMLString.h"

@implementation NSString (TMBHTMLString)

- (NSAttributedString *)convertedHTMLString
{
    return [[NSAttributedString alloc] initWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                            options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                      NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)}
                                 documentAttributes:nil
                                              error:nil];
}

@end
