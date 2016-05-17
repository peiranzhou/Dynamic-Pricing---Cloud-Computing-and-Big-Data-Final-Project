//
//  GenerateQRcodeViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/9/16.
//  Copyright © 2016 zzzl. All rights reserved.
//

#import "AppDelegate.h"
#import "UIImage+QRCodeGenerator.h"
#import "GenerateQRcodeViewController.h"

@interface GenerateQRcodeViewController ()

@end


@implementation GenerateQRcodeViewController

@synthesize imgView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    // Setting the generated QR Code format
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,200,200)];
    
    AppDelegate *appDelegate9 = [[UIApplication sharedApplication] delegate];    // Set global value
    NSString *productInfoQRcode = [NSString stringWithFormat:@"Username: %@, Product Description: %@, Bid Price: %@, Business Name: %@", appDelegate9.usernameGlobal, appDelegate9.descriptionGlobal, appDelegate9.bid_price, appDelegate9.businessnameGlobal];
    
    
    imgView.image = [UIImage QRCodeGenerator: productInfoQRcode
                              andLightColour:[UIColor blackColor]
                               andDarkColour:[UIColor whiteColor]
                                andQuietZone:1
                                     andSize:300];
    
    //    ViewController *myViewController = [[ViewController alloc] initWithNibName:@"MyView" bundle:nil];
    //    myViewController.view.frame = CGRectMake(0, 100, myViewController.view.frame.size.width, myViewController.view.frame.size.height);
    
    imgView.frame = CGRectMake(85, 150, imgView.frame.size.width, imgView.frame.size.height);
    
    
    [self.view addSubview:imgView];
    
}

// Transfer different views

- (IBAction)logout3:(id)sender {
    [self performSegueWithIdentifier:@"qrcodeToLogin" sender:self];
}
- (IBAction)mainpage2:(id)sender {
    [self performSegueWithIdentifier:@"qrcodeToMainpage" sender:self];
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
