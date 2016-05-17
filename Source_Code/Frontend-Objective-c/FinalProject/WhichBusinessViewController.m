//
//  WhichBusinessViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/10/16.
//  Copyright © 2016 zzzl. All rights reserved.
//
#import "AppDelegate.h"
#import "WhichBusinessViewController.h"

@interface WhichBusinessViewController ()

@end

@implementation WhichBusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// Choose the business that the customer is locating

- (IBAction)macy:(id)sender {
    AppDelegate *appDelegate11 = [[UIApplication sharedApplication] delegate];    // Set global value
    appDelegate11.businessnameGlobal = @"macys";
    [self performSegueWithIdentifier:@"WhichBusinessToScan" sender:self];
}
- (IBAction)walmart:(id)sender {
    AppDelegate *appDelegate11 = [[UIApplication sharedApplication] delegate];    // Set global value
    appDelegate11.businessnameGlobal = @"walmart";
    [self performSegueWithIdentifier:@"WhichBusinessToScan" sender:self];
}
- (IBAction)costco:(id)sender {
    AppDelegate *appDelegate11 = [[UIApplication sharedApplication] delegate];    // Set global value
    appDelegate11.businessnameGlobal = @"costco";
    [self performSegueWithIdentifier:@"WhichBusinessToScan" sender:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
