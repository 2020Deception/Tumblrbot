//
//  Photo.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "Photo.h"
#import "TMBLinkPost.h"
#import "TMBPhotoPost.h"
#import "Image.h"

@implementation Photo

+ (Photo *)photoFromDictionary:(NSDictionary *)dictionary inContext:(NSManagedObjectContext *)context
{
    Photo *photo = [[[self class] alloc] initWithEntity:[NSEntityDescription entityForName:@"Photo" inManagedObjectContext:context]
                         insertIntoManagedObjectContext:context];
    
    photo.caption = [dictionary stringValueForKey:@"caption"];
    photo.width = [dictionary numberValueForKey:@"width"];
    photo.height = [dictionary numberValueForKey:@"height"];
    photo.url = [dictionary stringValueForKey:@"url"];
    
    photo.image = [Image imageFromData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photo.url]] inContext:context];
    
    return photo;
}

@end
