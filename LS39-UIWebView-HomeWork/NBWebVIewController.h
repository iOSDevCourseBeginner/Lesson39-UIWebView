//
//  NBWebVIewController.h
//  LS39-UIWebView-HomeWork
//
//  Created by Nick Bibikov on 2/5/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBWebVIewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadIndicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *reloadButton;

- (IBAction)moveBack:(UIBarButtonItem *)sender;
- (IBAction)moveForward:(UIBarButtonItem *)sender;
- (IBAction)reloadData:(UIBarButtonItem *)sender;

@property (strong, nonatomic) NSURL* dataURL;


@end
