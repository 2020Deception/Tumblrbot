//
//  TMBChatTableViewDataSource.m
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBChatTableViewDataSource.h"
#import "TMBChatTableViewCell.h"
#import "NSString+TMBHTMLString.h"
#import "TMBChatPost.h"
#import "TMBBaseTextView.h"
#import "Dialogue.h"

@interface TMBChatTableViewDataSource ()

@property (strong) TMBChatPost *post;

@end

@implementation TMBChatTableViewDataSource

- (instancetype)initWithPost:(TMBChatPost *)post
{
    if (self = [super init]) {
        _post = post;
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.post.chat.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TMBChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    Dialogue *dialogue = self.post.chat[indexPath.row];
    cell.textView.attributedText = dialogue.phrase.convertedHTMLString;
    return cell;
}

@end
