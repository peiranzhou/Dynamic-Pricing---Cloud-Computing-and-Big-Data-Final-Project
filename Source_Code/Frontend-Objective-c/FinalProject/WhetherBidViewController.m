//
//  WhetherBidViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/8/16.
//  Copyright © 2016 zzzl. All rights reserved.
//
#import "AppDelegate.h"
#import "WhetherBidViewController.h"

@interface WhetherBidViewController ()

@end

@implementation WhetherBidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)WantToBid:(id)sender {
    
    AppDelegate *appDelegate2 = [[UIApplication sharedApplication] delegate];
    
    // Judge whether the user has authority to bid. (Through barcode, businessname, username to judge.)
    NSString *urlStr = [NSString stringWithFormat:@"http://dynamicpricing-env.us-east-1.elasticbeanstalk.com/bid?barcode=%@&businessname=%@&username=%@", appDelegate2.barcodeGlobal, appDelegate2.businessnameGlobal, appDelegate2.usernameGlobal];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", responseStr);
    
    
    // If return Forbidden, it means the user lose the authority to bid
    if([responseStr isEqualToString:@"Forbidden"]){
        
        UIAlertView *alreadyBidAlert = [[UIAlertView alloc] initWithTitle:@"Sorry You Have Already Bid!"
                                                                message:@"Please scan other products~"
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
        
        [alreadyBidAlert show];
        
        [self performSegueWithIdentifier:@"WhetherBidToMainpage" sender:self];

    }
    
    // If the return value is nor forbidden, it means the user has authourity to bid. And the server will return the information of product and the bottom price. Setting the itemname, description, price as global variable.
    else{
    
    // Dealing with the back http segment
    responseStr = [responseStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    responseStr = [responseStr stringByReplacingOccurrencesOfString:@"}" withString:@""];
    responseStr = [responseStr stringByReplacingOccurrencesOfString:@"{" withString:@""];
    NSLog(@"%@", responseStr);
        
    NSArray *subStrings = [responseStr componentsSeparatedByString:@","];
    NSString *itemnameOrg = [subStrings objectAtIndex:0];
    NSString *descriptionOrg = [subStrings objectAtIndex:1];
    NSString *priceOrg = [subStrings objectAtIndex:2];
    
    NSString *itemname = [itemnameOrg substringFromIndex:9];
    NSString *description = [descriptionOrg substringFromIndex:12];
    NSString *price = [priceOrg substringFromIndex:6];
    
        
    NSLog(@"%@", itemname);
    NSLog(@"%@", description);
    NSLog(@"%@", price);
    
    
    // After finishing the dealing value, set the Global Variable
    AppDelegate *appDelegate3 = [[UIApplication sharedApplication] delegate];    // Set global value
    appDelegate3.descriptionGlobal = description;
    appDelegate3.lowestPriceGlobal = price;
    appDelegate3.itemnameGlobal = itemname;
    
        
    // Entering bid view
    [self performSegueWithIdentifier:@"BidYes" sender:self];

    }
    
}

// Transfer different views

- (IBAction)regretBid:(id)sender {
    [self performSegueWithIdentifier:@"WhetherBidToMainpage" sender:self];
}

- (IBAction)logout:(id)sender {
    [self performSegueWithIdentifier:@"whetherBidToLogin" sender:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
