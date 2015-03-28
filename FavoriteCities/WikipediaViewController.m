//
//  WikipediaViewController.m
//  FavoriteCities
//
//  Created by Justin Haar on 3/20/15.
//  Copyright (c) 2015 Justin Haar. All rights reserved.
//

#import "WikipediaViewController.h"

@interface WikipediaViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *wikiWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WikipediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if ([self.city.cityName isEqual:@"New York"]) {
        [self performLoadRequestWithString:@"http://en.wikipedia.org/wiki/New_York_City"];
    } else if ([self.city.cityName isEqual:@"Miami"]) {
        [self performLoadRequestWithString:@"http://en.wikipedia.org/wiki/Miami"];
    } else if ([self.city.cityName isEqual:@"San Francisco"]) {
        [self performLoadRequestWithString:@"http://en.wikipedia.org/wiki/San_Francisco"];
    } else if ([self.city.cityName isEqual:@"Las Vegas"]) {
        [self performLoadRequestWithString:@"http://en.wikipedia.org/wiki/Las_Vegas"];
    }

    self.activityIndicator.hidesWhenStopped = YES;


}


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
}



-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
}

- (void)performLoadRequestWithString:(NSString *)string
{
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.wikiWebView  loadRequest:urlRequest];
}


- (IBAction)dismissButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
