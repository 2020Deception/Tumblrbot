//
//  TMBPhotoTableViewDataSource.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBPhotoTableViewDataSource.h"
#import "TMBPhotoTableViewCell.h"
#import "TMBPhotoPost.h"
#import "Photo.h"
#import "Image.h"

@interface TMBPhotoTableViewDataSource ()

@property (strong) TMBPhotoPost *post;

@end

@implementation TMBPhotoTableViewDataSource

- (instancetype)initWithPost:(TMBPhotoPost *)post
{
    if (self = [super init]) {
        _post = post;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.post.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMBPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Photo *photo = self.post.photos[indexPath.row];
    cell.photoImageView.image = photo.image.image;
    return cell;
}

@end
