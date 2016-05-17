//
//  epriceViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/8/16.
//  Copyright (c) 2016 zzzl. All rights reserved.
//

#import "epriceViewController.h"

@interface epriceViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *ePrice;

@end

@implementation epriceViewController

// Visualizing the ebay web page

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *ebayString = @"http://www.ebay.com/";
    NSURL *ebay = [NSURL URLWithString:ebayString];
    NSURLRequest *ebayRequest = [NSURLRequest requestWithURL:ebay];
    [_ePrice loadRequest:ebayRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
