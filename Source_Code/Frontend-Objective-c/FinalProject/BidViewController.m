//
//  BidViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/8/16.
//  Copyright © 2016 zzzl. All rights reserved.
//

#import "AppDelegate.h"
#import "BidViewController.h"

@interface BidViewController ()

// passingValue used as product information
@property (weak, nonatomic) IBOutlet UILabel *passingValue;
@property (weak, nonatomic) IBOutlet UITextField *expectingPrice;
@property int countcount;
@property (weak, nonatomic) IBOutlet UILabel *passingValueDescription;
@property (weak, nonatomic) IBOutlet UILabel *passingValueBusiness;

@end

@implementation BidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate4 = [[UIApplication sharedApplication] delegate];
    
    self.countcount = 0;
    
    // Visualize the information of product
    [self.passingValue setText: appDelegate4.itemnameGlobal];
    [self.passingValueDescription setText: appDelegate4.descriptionGlobal];
    [self.passingValueBusiness setText: appDelegate4.businessnameGlobal];

}


- (IBAction)confirmPrice:(id)sender {
    
    // Get the lowest price of product, used to make as the reference.
    AppDelegate *appDelegate5 = [[UIApplication sharedApplication] delegate];
    
    
    // Transfer the data type of Bid / Lowest price（NSString - NSNumber）
    NSNumber *lowestPrice2 = @([appDelegate5.lowestPriceGlobal floatValue]);
    NSNumber *expectPrice = @([self.expectingPrice.text floatValue]);
    NSLog(@"%@", expectPrice);
    
    
    // The bid text field can not be empty.
    if([self.expectingPrice.text isEqualToString:@""]){
        UIAlertView *notEmptyAlert = [[UIAlertView alloc] initWithTitle:@"Space can not be empty"
                                                             message:@"Please enter price!"
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        [notEmptyAlert show];
    }
    
    
    else{
    
    // If bid price is lower than the lowest price
    if([expectPrice floatValue] < [lowestPrice2 floatValue]){
        
        // Timer, each user can bid each product three times.
        self.countcount = self.countcount + 1;
        
        
        if(self.countcount >2){
            NSLog(@"Say good bye to this product!");
            
            // If bid failed three times, sent the value of username, barcode, businessname, bid_price=0 to server and recording in database，recording this username, forbidding the user bid the same product again.
            NSString *urlStr = [NSString stringWithFormat:@"http://dynamicpricing-env.us-east-1.elasticbeanstalk.com/transaction?username=%@&barcode=%@&businessname=%@&bid_price=0", appDelegate5.usernameGlobal, appDelegate5.barcodeGlobal, appDelegate5.businessnameGlobal];
            NSURL *url = [NSURL URLWithString:urlStr];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            NSURLResponse *response;
            NSError *error;
            NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
            NSLog(@"%@", responseStr);
            
            self.countcount = 0;
            
            [self performSegueWithIdentifier:@"failBid" sender:self];
            
        }
        
        
        if(self.countcount != 0){
        
        NSString *theAnswer = [NSString stringWithFormat:@"The rest of times: %d", 3-self.countcount];
        
        UIAlertView *bidAgainAlert = [[UIAlertView alloc] initWithTitle:@"Your price is so low!"
                                                                message:theAnswer
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
        [bidAgainAlert show];
            
        }
        
        NSLog(@"Re-Bid!");
        
    }
    
    // If bid price is bigger than lowest price provided by business
    else{
        
        // Setting global price: bid_price
        AppDelegate *appDelegate6 = [[UIApplication sharedApplication] delegate];
        appDelegate6.bid_price = self.expectingPrice.text;
        
        // Recroding the detail information of bid action: username, barcode, businessname, bid_price. And the user can not bid within 24 hours.
        NSString *urlStr = [NSString stringWithFormat:@"http://dynamicpricing-env.us-east-1.elasticbeanstalk.com/transaction?username=%@&barcode=%@&businessname=%@&bid_price=%@", appDelegate5.usernameGlobal, appDelegate5.barcodeGlobal, appDelegate5.businessnameGlobal, [expectPrice stringValue]];
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLResponse *response;
        NSError *error;
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", responseStr);
        
        NSLog(@"It's yours!");
        
        [self performSegueWithIdentifier:@"successBid" sender:self];
        
    }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

// Transfer views 

- (IBAction)logout2:(id)sender {
    [self performSegueWithIdentifier:@"bidToLogin" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing: YES];
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
