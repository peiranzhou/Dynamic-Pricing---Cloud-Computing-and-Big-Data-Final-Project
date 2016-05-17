//
//  apriceViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/8/16.
//  Copyright (c) 2016 zzzl. All rights reserved.
//

#import "apriceViewController.h"

@interface apriceViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *aPrice;

@end

@implementation apriceViewController

// Visualizing the amazon web page

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *amazonString = @"http://www.amazon.com/";
    
    NSURL *amazon = [NSURL URLWithString:amazonString];
    
    NSURLRequest *amazonRequest = [NSURLRequest requestWithURL:amazon];
    
    [_aPrice loadRequest:amazonRequest];
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
