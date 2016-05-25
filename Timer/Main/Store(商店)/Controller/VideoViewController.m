//
//  VideoViewController.m
//  Timer
//
//  Created by lx on 16/5/24.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@property (nonatomic, weak)UIWebView *webView;


@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"视频新闻";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUrl:(NSString *)url{
    
    _url = url;
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    _webView = webView;
    
    [self.view addSubview:_webView];


    NSURL *u = [NSURL URLWithString:url];

    NSURLRequest *request = [NSURLRequest requestWithURL:u];

    [_webView loadRequest:request];

    
}

@end
