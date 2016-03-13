//
//  RoundedButton.h
//  animatioin.uiview
//
//  Created by Joohae Kim on 2016. 3. 12..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface RoundedButton : UIButton

@property (nonatomic) IBInspectable NSInteger  lineWidth;
@property (nonatomic) IBInspectable NSInteger  radius;
@property (nonatomic) IBInspectable UIColor   *lineColor;
@end
