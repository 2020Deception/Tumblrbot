//
//  Image.m
//  Tumblrbot
//
//  Created by Brian Sharrief Alim Bowman on 7/13/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "Image.h"
#import "Photo.h"

@implementation Image

+ (Image *)imageFromData:(NSData *)data inContext:(NSManagedObjectContext *)context
{
    Image *image = [NSEntityDescription insertNewObjectForEntityForName:@"Image"
                                                 inManagedObjectContext:context];
    image.image = [UIImage imageWithData:data];
    
    return image;
}

@end

#pragma mark -

@implementation ImageToDataTransformer

+ (BOOL)allowsReverseTransformation {
    return YES;
}

+ (Class)transformedValueClass {
    return [NSData class];
}

- (id)transformedValue:(id)value {
    NSData *data = UIImagePNGRepresentation(value);
    return data;
}

- (id)reverseTransformedValue:(id)value {
    UIImage *uiImage = [[UIImage alloc] initWithData:value];
    return uiImage;
}

@end