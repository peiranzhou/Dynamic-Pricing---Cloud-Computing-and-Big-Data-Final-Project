//
//  UIImage+QRCodeGenerator.h
//  FinalProject
//
//  Created by Peiran Zhou on 5/9/16.
//  Copyright © 2016 zzzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QRCodeGenerator)

+ (UIImage*)QRCodeGenerator:(NSString*)iData
             andLightColour:(UIColor*)iLightColour
              andDarkColour:(UIColor*)iDarkColour
               andQuietZone:(NSInteger)iQuietZone
                    andSize:(NSInteger)iSize;

@end
