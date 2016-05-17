//
//  EbayPriceViewController.m
//  FinalProject
//
//  Created by 周沛然 on 5/8/16.
//  Copyright (c) 2016 zzzl. All rights reserved.
//

#import "EbayPriceViewController.h"

@interface EbayPriceViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *ebayOnlinePrice;

@end

@implementation EbayPriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *ebayString = @"http://www.ebay.com/";
    NSURL *ebay = [NSURL URLWithString:ebayString];
    NSURLRequest *ebayRequest = [NSURLRequest requestWithURL:ebay];
    [_ebayOnlinePrice loadRequest:ebayRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
