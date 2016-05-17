//
//  DetailViewController.m
//  Master
//
//  Created by Peiran Zhou on 15/4/1.
//  Copyright (c) 2015年 zhouPeiran. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

//@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (weak, nonatomic) IBOutlet UIWebView *detailWebView;


-(void)configureView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        NSLog(@"NO!");
        
        // Update the view.
        [self configureView];
    }
    //    if (self.masterPopoverController != nil)
    //    {
    //        [self.masterPopoverController dismissPopoverAnimated:YES];
    //    }
}


// Visualize the web info


- (void)configureView {
    if (self.detailItem) {
        NSLog(@"configureView");
        NSURL *detailURL;
        detailURL = [[NSURL alloc]initWithString:self.detailItem[@"url"]];
        [self.detailWebView loadRequest:[NSURLRequest requestWithURL:detailURL]];
        self.navigationItem.title = self.detailItem[@"name"];
        self.detailDescriptionLabel.hidden = YES;
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    NSLog(@"%f", self.detailWebView.frame.size.width);
    NSLog(@"%@", self.detailItem[@"url"]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

//#pragma mark - Split view
//
//- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
//{
//    barButtonItem.title = NSLocalizedString(@"Flower List", @"Flower List");
//    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
//    self.masterPopoverController = popoverController;
//}
//
//- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
//{
//    // Called when the view is shown again in the split view, invalidating the button and popover controller.
//    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
//    self.masterPopoverController = nil;
//}




@end
