//
//  ForgetPasswordViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/9/16.
//  Copyright © 2016 zzzl. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *forgetPasswordUsername;
@property (weak, nonatomic) IBOutlet UITextField *forgetPasswordEmail;

@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)requestPassword:(id)sender {
    
    BOOL isUsernameEmpty = [self.forgetPasswordUsername.text isEqualToString:@""];
    BOOL isPasswordEmpty = [self.forgetPasswordEmail.text isEqualToString:@""];
    
    BOOL isPasswordFormatIsRight = [self NSStringIsValidEmail:self.forgetPasswordEmail.text];
    
    // Judge whether two input textfileds empty or not.
    if(isUsernameEmpty || isPasswordEmpty){
        UIAlertView *notTotallyEmptyAlert = [[UIAlertView alloc] initWithTitle:@"What!?"
                                                                          message:@"Please, don't keep empty!! OK!?"
                                                                         delegate:self
                                                                cancelButtonTitle:@"GO"
                                                                otherButtonTitles:nil];
        [notTotallyEmptyAlert show];
        self.forgetPasswordUsername.text = @"";
        self.forgetPasswordEmail.text = @"";
    }
    
    // If two input textfields are not empty, implmenting the following code.
    else{
    if(isPasswordFormatIsRight){
    
    NSString *urlStr = [NSString stringWithFormat:@"http://dynamicpricing-env.us-east-1.elasticbeanstalk.com/forgetPassword?username=%@&email=%@", self.forgetPasswordUsername.text, self.forgetPasswordEmail.text];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseStr = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", responseStr);
    BOOL isPasswordHasBeenSent = [responseStr isEqualToString: @"OK"];
    if(isPasswordHasBeenSent){
        self.forgetPasswordUsername.text = @"";
        self.forgetPasswordEmail.text = @"";
        // Starting the UI alert view
        UIAlertView *successGetPasswordAlert = [[UIAlertView alloc] initWithTitle:@"Congratulations!"
                                                                       message:@"Password Has Been Sent!!"
                                                                      delegate:self
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles:nil];
        [successGetPasswordAlert show];
        [self performSegueWithIdentifier:@"gotoLogin" sender:self];
    }
    else{
        // Starting the UI alert view
        UIAlertView *failGetPasswordAlert = [[UIAlertView alloc] initWithTitle:@"Fail to Send You Password!"
                                                             message:@"Username or Email is Wrong!!"
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        self.forgetPasswordUsername.text = @"";
        self.forgetPasswordEmail.text = @"";
        [failGetPasswordAlert show];
    }
        
    }
    else{
        // Starting the UI alert view
        UIAlertView *emailFormatIsWrongAlert = [[UIAlertView alloc] initWithTitle:@"Your email format is wrong!"
                                                                    message:@"Please enter again!!"
                                                                    delegate:self
                                                                    cancelButtonTitle:@"OK"
                                                                    otherButtonTitles:nil];
        self.forgetPasswordUsername.text = @"";
        self.forgetPasswordEmail.text = @"";
        [emailFormatIsWrongAlert show];
    }
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing: YES];
}

// Judge whether the email format is correct
-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
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
