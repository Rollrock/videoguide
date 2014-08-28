//
//  MyWebViewController.m
//  Disney
//
//  Created by zhuang chaoxiao on 13-11-29.
//  Copyright (c) 2013年 zhuang chaoxiao. All rights reserved.
//

#import "MyWebViewController.h"

@interface MyWebViewController ()
{
    UIWebView * _webView;
}
@end

@implementation MyWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self clearCookies];
    
    CGRect rect;
    rect = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height);
    
    _webView  = [[UIWebView alloc]initWithFrame:rect];
    
    NSURL * url = [NSURL URLWithString:self.urlStr];
    NSURLRequest * req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
    
    [self.view addSubview:_webView];
}


-(void)clearCookies
{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    for (cookie in [storage cookies])
    {
        [storage deleteCookie:cookie];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
