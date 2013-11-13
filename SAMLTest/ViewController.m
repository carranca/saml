//
//  ViewController.m
//  SAMLTest
//
//  Created by Mario Carranca on 2013-11-09.
//  Copyright (c) 2013 TribeHR. All rights reserved.
//

#import "ViewController.h"

#define SAML_URL			@"https://app.onelogin.com/trust/saml2/http-post/sso/299925?SAMLRequest=fVNdb9owFH3vr6jyDnEoDLBIpIxuKxKDCNI97M12boYlx858nZb%2B%2BzkfXem04hcrx%2Bccn3t9s0JWqZqmjTvpA%2FxuAN3NrV%2FnSmmk3WEcNFZTw1Ai1awCpE7QY%2Fp9SydjQmtrnBFGBf%2FIrqsYIlgnje5lm%2Fs42O%2B%2BbPffNjsQfMnLUny6K%2BeczWAqJhEny1k0JWxKZnwh5oIsOe%2BVP8Cit4kD7zp4ITaw0eiYdh4m0d0oikZkmUcLSuZ0Qn72vGwI%2FlnqQupf1%2FPynoT0Ic%2BzUbY%2F5r1J%2BlrH2mhsKrBHsE9SwONhGwcn52oahsoIpgp4GlcvzkoOJzv2X3RBFiRsOxVawNrLIUg6z1UL0q4Mm%2BSt4uGwCi%2FBN1pNdz7r5j4zSoqXDm%2FXV2Mr5j4uKRpHHSKLUdlRKVRMqrQofBYM%2FvqkSpnntQXmIA6cbXzEPsn7e98FGqYIim6mfF8cnN3t2lQ1sxLbp4IzE24o9q3gS%2Fpa%2BQE5QJlcnSFBRcvzcOa3Z2OL9k1B%2BLtzy7RvqnVD4%2F5r3qcOr8RObl6PL3%2BQ5A8%3D"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:SAML_URL]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	
	switch (navigationType) {
		case UIWebViewNavigationTypeBackForward:
			NSLog(@"BACK_FORWARD");
			break;
		case UIWebViewNavigationTypeFormResubmitted:
			NSLog(@"RESUBMITTED");
			break;
		case UIWebViewNavigationTypeFormSubmitted:
			NSLog(@"SUBMITTED");
			NSLog(@"Request: %@", request);
			NSLog(@"URL: %@", request.URL);
			NSLog(@"Main URL: %@", request.mainDocumentURL);
			NSLog(@"DATA: %@", [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding]);
			break;
		case UIWebViewNavigationTypeLinkClicked:
			NSLog(@"CLICK");
			break;
		case UIWebViewNavigationTypeOther:
			NSLog(@"OTHER");
			break;
		case UIWebViewNavigationTypeReload:
			NSLog(@"RELOAD");
			break;
		default:
			break;
	}
	
	return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
	
}

@end
