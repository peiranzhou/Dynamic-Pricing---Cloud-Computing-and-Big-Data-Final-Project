//
//  AppDelegate.h
//  FinalProject
//
//  Created by Peiran Zhou on 4/9/16.
//  Copyright (c) 2016 zzzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Defining the global value

@property (nonatomic, retain) NSString *usernameGlobal;
@property (nonatomic, retain) NSString *barcodeGlobal;
@property (nonatomic, retain) NSString *businessnameGlobal;
@property (nonatomic, retain) NSString *lowestPriceGlobal;
@property (nonatomic, retain) NSString *descriptionGlobal;
@property (nonatomic, retain) NSString *itemnameGlobal;
@property (nonatomic, retain) NSString *bid_price;

@end

