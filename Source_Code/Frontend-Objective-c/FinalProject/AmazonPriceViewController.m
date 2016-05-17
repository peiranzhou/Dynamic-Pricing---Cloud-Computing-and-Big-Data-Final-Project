//
//  AmazonPriceViewController.m
//  FinalProject
//
//  Created by 周沛然 on 5/8/16.
//  Copyright (c) 2016 zzzl. All rights reserved.
//

#import "AmazonPriceViewController.h"

@interface AmazonPriceViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *amazonOnlinePrice;

@end

@implementation AmazonPriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *amazonString = @"http://www.amazon.com/";
    NSURL *amazon = [NSURL URLWithString:amazonString];
    NSURLRequest *amazonRequest = [NSURLRequest requestWithURL:amazon];
    [_amazonOnlinePrice loadRequest:amazonRequest];
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
