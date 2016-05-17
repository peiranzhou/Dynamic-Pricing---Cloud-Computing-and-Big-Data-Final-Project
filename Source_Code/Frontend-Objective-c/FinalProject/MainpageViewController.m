//
//  MainpageViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/10/16.
//  Copyright © 2016 zzzl. All rights reserved.
//

#import "MainpageViewController.h"

@interface MainpageViewController ()

@end

@implementation MainpageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Transfer the page
- (IBAction)logout6:(id)sender {
    [self performSegueWithIdentifier:@"mainpageToLogin" sender:self];
}
- (IBAction)checkMyAcount:(id)sender {
    [self performSegueWithIdentifier:@"myAccountInfo" sender:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
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
