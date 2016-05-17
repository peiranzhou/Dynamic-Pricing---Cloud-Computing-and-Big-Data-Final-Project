//
//  RegistViewController.m
//  FinalProject
//
//  Created by Peiran Zhou on 5/8/16.
//  Copyright (c) 2016 zzzl. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registUsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *registPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *registPassword2TextField;
@property (weak, nonatomic) IBOutlet UITextField *registEmail;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.registPasswordTextField.secureTextEntry = YES;
    self.registPassword2TextField.secureTextEntry = YES;
}

- (IBAction)registButtonIsTyped:(id)sender {
    
    // Check whether the email format is correct
    BOOL isEmailFormat = [self NSStringIsValidEmail:self.registEmail.text];
    
    // Check whether username textfield is empty or not
    NSRange whiteSpaceRange = [self.registUsernameTextField.text rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]];
    if (whiteSpaceRange.location != NSNotFound) {
        NSLog(@"Found whitespace");
        UIAlertView *whiteSpaceAlert2 = [[UIAlertView alloc] initWithTitle:@"Username is not valid!"
                                                                  message:@"Please re-enter username!"
                                                                 delegate:self
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil];
        self.registUsernameTextField.text = @"";
        
        [whiteSpaceAlert2 show];
    }
    else{
    
    // Check is there any text field is empty
        
    BOOL passwordIsEqual = [_registPasswordTextField.text isEqualToString:(_registPassword2TextField.text)];
    
    BOOL textField1IsEmpty = [_registUsernameTextField.text isEqualToString:(@"")];
    BOOL textField2IsEmpty = [_registPasswordTextField.text isEqualToString:(@"")];
    BOOL textField3IsEmpty = [_registPassword2TextField.text isEqualToString:(@"")];
        BOOL textField4IsEmpty = [_registEmail.text isEqualToString:(@"")];
    
    if(textField1IsEmpty || textField2IsEmpty || textField3IsEmpty || textField4IsEmpty){
        UIAlertView *textfieldEmptyAlert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                     message:@"Man, text field can not be empty!"
                                                                    delegate:self
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil];
        [textfieldEmptyAlert show];
        // Setting the text field to empty
        self.registUsernameTextField.text = @"";
        self.registPasswordTextField.text = @"";
        self.registPassword2TextField.text = @"";
    }
    else{
    
    if(isEmailFormat){
    if(passwordIsEqual){
        
        // if password equal, register process is correct
        
        NSLog(@"Equal");

        NSString *urlStr2 = [NSString stringWithFormat:@"http://dynamicpricing-env.us-east-1.elasticbeanstalk.com/signup?username=%@&password=%@&email=%@", self.registUsernameTextField.text, self.registPasswordTextField.text, self.registEmail.text];
        NSURL *url2 = [NSURL URLWithString:urlStr2];
        NSURLRequest *request2 = [NSURLRequest requestWithURL:url2];
        NSURLResponse *response2;
        NSError *error2;
        NSLog(@"qwerasdf");
        NSData *responseData2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:&response2 error:&error2];
        NSLog(@"qwerasdf2");

        NSString *responseStr2 = [[NSString alloc] initWithData:responseData2 encoding:NSUTF8StringEncoding];
        NSLog(@"%@", responseStr2);
        
        BOOL isSuccess2 = [responseStr2 isEqualToString:(@"Accepted")];
        BOOL isFail2 = [responseStr2 isEqualToString:(@"Not Acceptable")];
        
        if(isSuccess2){
            NSLog(@"haha");

            UIAlertView *registSuccessAlert = [[UIAlertView alloc] initWithTitle:@"Congratulation!"
                                                                         message:@"You have successfully registed!"
                                                                        delegate:self
                                                               cancelButtonTitle:@"OK"
                                                               otherButtonTitles:nil];
            [registSuccessAlert show];
            [self performSegueWithIdentifier:@"registToWelcome" sender:self];
        }
        if(isFail2){
            UIAlertView *registFailAlert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                                         message:@"The username has been occupied, please choose another one!"
                                                                        delegate:self
                                                               cancelButtonTitle:@"OK"
                                                               otherButtonTitles:nil];
            [registFailAlert show];
            self.registUsernameTextField.text = @"";
            self.registPasswordTextField.text = @"";
            self.registPassword2TextField.text = @"";
            self.registEmail.text = @"";
        }
        
    }
    else{
        NSLog(@"Not Equal");
        
        // Starting the UI Alert View
        
        UIAlertView *passwordWrongAlert = [[UIAlertView alloc] initWithTitle:@"Password is not match!"
                                                             message:@"Please re-enter the password"
                                                            delegate:self
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
        [passwordWrongAlert show];

        self.registPasswordTextField.text = @"";
        self.registPassword2TextField.text = @"";
        
    }
    
    }
    else{
        
        NSLog(@"email is wrong");
        UIAlertView *emailFormatWrongAlert = [[UIAlertView alloc] initWithTitle:@"E-Mail format is wrong!!"
                                                                     message:@"Please re-enter the email address"
                                                                    delegate:self
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil];
        [emailFormatWrongAlert show];
        self.registEmail.text = @"";
        self.registPasswordTextField.text = @"";
        self.registPassword2TextField.text = @"";
    }
    }
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}


// Judge whether the email address if correct
-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
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
