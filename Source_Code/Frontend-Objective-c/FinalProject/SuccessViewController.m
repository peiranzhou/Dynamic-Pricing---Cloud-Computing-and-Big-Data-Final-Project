//
//  SuccessViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/9/16.
//  Copyright © 2016 zzzl. All rights reserved.
//

#import "SuccessViewController.h"

@interface SuccessViewController ()

@end

@implementation SuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                                   selector:@selector(automaticTransfer) userInfo:nil repeats:NO];

}

// Transfer between different pages

-(void)automaticTransfer{
    [self performSegueWithIdentifier:@"qrcode" sender:self];
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
