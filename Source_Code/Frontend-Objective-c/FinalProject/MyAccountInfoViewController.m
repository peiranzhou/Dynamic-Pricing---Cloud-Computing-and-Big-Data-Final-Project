//
//  MyAccountInfoViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/11/16.
//  Copyright © 2016 zzzl. All rights reserved.
//
#import "AppDelegate.h"
#import "MyAccountInfoViewController.h"

@interface MyAccountInfoViewController ()
@property (weak, nonatomic) IBOutlet UITextView *myAccountHistory;
@property (weak, nonatomic) IBOutlet UILabel *Directory;


@end

@implementation MyAccountInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    AppDelegate *appDelegate13 = [[UIApplication sharedApplication] delegate];    // Set global value
    
    // Getting the bid history record from databse (HTTP request)
    NSString *urlStr = [NSString stringWithFormat:@"http://dynamicpricing-env.us-east-1.elasticbeanstalk.com/profile?username=%@", appDelegate13.usernameGlobal];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", responseStr);
    
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@"}" withString:@""];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@"{" withString:@""];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@"[" withString:@""];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@"]" withString:@""];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@",bid" withString:@"\rbid"];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@",iid" withString:@"\riid"];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@",bid_price" withString:@"\rbid_price"];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@",time" withString:@"\rtime"];
//    responseStr = [responseStr stringByReplacingOccurrencesOfString:@",username" withString:@"\r\rusername"];
    
//    NSArray *subStrings = [responseStr componentsSeparatedByString:@"\n"];
//    
//    unsigned long a = [subStrings count];
//    
//    NSLog(@"%lu", a);
    
    
    
//    NSString *itemname = [itemnameOrg substringFromIndex:9];
//    NSString *description = [descriptionOrg substringFromIndex:12];
//    NSString *price = [priceOrg substringFromIndex:6];
    
    
    // Visualize the return value
    [self.myAccountHistory setText: responseStr];
    [self.Directory setText: @" Business         Item           Price              Date"];
//    self.myAccountHistory.lineBreakMode = NSLineBreakByWordWrapping;
//    self.myAccountHistory.numberOfLines = 0;
    
    

    

    
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
