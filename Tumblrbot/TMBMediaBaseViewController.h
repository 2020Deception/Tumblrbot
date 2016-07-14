//
//  TMBMediaBaseViewController.h
//  Tumblrbot
//
//  Created by Brian Bowman on 7/16/16.
//  Copyright © 2016 Matthew Bischoff. All rights reserved.
//

#import "TMBBaseViewController.h"

/** TMBMediaBaseViewController is the base all media based TMBMediaBaseViewController instances */
@interface TMBMediaBaseViewController : TMBBaseViewController <UIWebViewDelegate>

/** embeddedView the embedded webView in which the interactive content is displayed */
@property (weak) IBOutlet UIWebView *embeddedView;

@end
