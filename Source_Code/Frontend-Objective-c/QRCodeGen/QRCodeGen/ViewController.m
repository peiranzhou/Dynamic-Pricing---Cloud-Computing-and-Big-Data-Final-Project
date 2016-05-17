//
//  ViewController.m
//  QRCodeGen
//
//  Created by Oscar Sanderson on 3/8/13.
//  Copyright (c) 2013 Oscar Sanderson. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+QRCodeGenerator.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imgView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor grayColor]];

    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,300,300)];
    
    imgView.image = [UIImage QRCodeGenerator:@"http://www.oscarsanderson.com"
                              andLightColour:[UIColor yellowColor]
                               andDarkColour:[UIColor redColor]
                                andQuietZone:1
                                     andSize:300];
    
    [self.view addSubview:imgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
