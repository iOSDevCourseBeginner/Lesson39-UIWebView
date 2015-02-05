//
//  NBWebVIewController.m
//  LS39-UIWebView-HomeWork
//
//  Created by Nick Bibikov on 2/5/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import "NBWebVIewController.h"

@implementation NBWebVIewController


- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.dataURL]];
}



#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [self.loadIndicator startAnimating];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.loadIndicator stopAnimating];
    [self refreshButtons];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [self refreshButtons];
    
    if([error code] != NSURLErrorCancelled) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    }
    
    NSLog(@"%@", [error localizedDescription]);
}



#pragma mark - Actions


- (IBAction)moveBack:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
}


- (IBAction)moveForward:(UIBarButtonItem *)sender {
    
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
}


- (IBAction)reloadData:(UIBarButtonItem *)sender {
    
    if (self.webView.isLoading) {
        [self.webView stopLoading];
        
    }
    
    [self.webView reload];
}


#pragma mark - Help methods 

- (void) refreshButtons {
    
    self.backButton.enabled = [self.webView canGoBack];
    self.forwardButton.enabled = [self.webView canGoForward];
}

@end
