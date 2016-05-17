//
//  DetailViewController.h
//  Master
//
//  Created by Peiran Zhou on 15/4/1.
//  Copyright (c) 2015年 zhouPeiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

