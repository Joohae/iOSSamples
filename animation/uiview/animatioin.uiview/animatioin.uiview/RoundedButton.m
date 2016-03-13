//
//  RoundedButton.m
//  animatioin.uiview
//
//  Created by Joohae Kim on 2016. 3. 12..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "RoundedButton.h"

@implementation RoundedButton
-(id)initWithCoder:(NSCoder *)aDecoder {
    if ([super initWithCoder:aDecoder]) {
        self.layer.masksToBounds = YES;
        self.lineWidth = 1;
        self.radius = 0;
        self.lineColor = [UIColor clearColor];
    }
    return self;
}

/*
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // Drawing code
}
// */

- (void) setLineWidth:(NSInteger)lineWidth {
    _lineWidth = lineWidth;
    self.layer.borderWidth = _lineWidth;
}

- (void) setRadius:(NSInteger)radius {
    _radius = radius;
    self.layer.cornerRadius = radius;
    self.layer.shadowRadius = radius;
}

- (void) setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    self.layer.borderColor = _lineColor.CGColor;
}
@end
