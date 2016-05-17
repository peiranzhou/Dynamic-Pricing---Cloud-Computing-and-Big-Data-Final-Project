//
//  ViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 4/9/16.
//  Copyright (c) 2016 zzzl. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
    self.username = @"username"; // Test Code
    self.password = @"password"; //Test Code
    
    self.passwordTextField.secureTextEntry = YES; // The secret is not visible
    
    NSLog(@"%@%@", self.username, self.password);
    
}

- (IBAction)landButtonWasTyped:(id)sender {
    
    NSRange whiteSpaceRange = [self.usernameTextField.text rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
    if (whiteSpaceRange.location != NSNotFound) {
        NSLog(@"Found whitespace");
        UIAlertView *whiteSpaceAlert = [[UIAlertView alloc] initWithTitle:@"Username is not valid"
                                                             message:@"Please re-enter username!"
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        self.usernameTextField.text = @"";
        [whiteSpaceAlert show];
    }
    else{
    
    // send username, password to server, and match with database. Getting the return result.
    NSString *urlStr = [NSString stringWithFormat:@"http://dynamicpricing-env.us-east-1.elasticbeanstalk.com/login?username=%@&password=%@", self.usernameTextField.text, self.passwordTextField.text];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
        
    BOOL isSuccess = [responseStr isEqualToString:(@"Accepted")];
    BOOL isFail = [responseStr isEqualToString:(@"Not Acceptable")];
    
    if(isSuccess){
        NSLog(@"haha");
        
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];    // Set global value
        appDelegate.usernameGlobal = self.usernameTextField.text;  
        
        [self performSegueWithIdentifier:@"login" sender:self];
        
        self.usernameTextField.text = @"";
        self.passwordTextField.text = @"";
    }
    if(isFail){
        UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Fail to Login"
                                                             message:@"Your Username or Password is wrong!"
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        self.usernameTextField.text = @"";
        self.passwordTextField.text = @"";
        [loginAlert show];
        NSLog(@"koko");
    }
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing: YES];
}


@end
