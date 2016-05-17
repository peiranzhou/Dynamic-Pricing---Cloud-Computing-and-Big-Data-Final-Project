//
//  MasterViewController.h
//  Master
//
//  Created by Peiran Zhou on 15/4/1.
//  Copyright (c) 2015年 zhouPeiran. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end

