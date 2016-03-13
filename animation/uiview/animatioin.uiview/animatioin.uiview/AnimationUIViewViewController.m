//
//  ViewController.m
//  animatioin.uiview
//
//  Created by Joohae Kim on 2016. 3. 12..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "AnimationUIViewViewController.h"

#define ANIMATION_KEY_FADEOUT @"ANIMATION_KEY_FADEOUT"
#define ANIMATION_KEY_FADEIN  @"ANIMATION_KEY_FADEIN"
#define ANIMATION_KEY_MOVE    @"ANIMATION_KEY_MOVE"

@interface AnimationUIViewViewController ()

@end

@implementation AnimationUIViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Core Animation
- (IBAction)didClickUseCoreAnimation:(id)sender {
    /*
    Reference:
     https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40004514-CH1-SW1
     
     CABasicAnimation: https://developer.apple.com/library/mac/#documentation/GraphicsImaging/Reference/CABasicAnimation_class/Introduction/Introduction.html
     
     CAPropertyAnimation: https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CAPropertyAnimation_class/index.html#//apple_ref/occ/clm/CAPropertyAnimation/animationWithKeyPath:
     
     CAAnimation: https://developer.apple.com/library/mac/documentation/GraphicsImaging/Reference/CAAnimation_class/index.html#//apple_ref/occ/cl/CAAnimation

     https://developer.apple.com/library/prerelease/mac/documentation/GraphicsImaging/Reference/CABasicAnimation_class/index.html
     
    Key path
        Path: https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html#//apple_ref/doc/uid/TP40004514-CH12-SW8
     
     Note: Don't forget the CABasicAnimation not move UIView neither model layer but moves presentation layer only.
     */
    
    CABasicAnimation *fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fade.fromValue = @(1.0f);
    fade.toValue = @(0.0f);
    fade.duration = 3.0f;
    fade.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    move.fromValue = @(_imageCat.frame.origin.y);
    move.toValue = @(self.view.bounds.size.height);
    move.duration = 3.0f;
    move.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    move.removedOnCompletion = NO;
    move.fillMode = kCAFillModeForwards;
    move.delegate = self;
    
    [_imageCat setAlpha:0.0f];
    [_imageCat.layer addAnimation:fade forKey:ANIMATION_KEY_FADEOUT];
    [_imageCat.layer addAnimation:move forKey:ANIMATION_KEY_MOVE];
}

#pragma mark CABasicAnimation Delegations
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"Animation did start");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"Animatino did stopped");

    /*  The image is bring back to the origin position when the animation is removed */
    [_imageCat.layer removeAnimationForKey:ANIMATION_KEY_MOVE];
    
    /*  Alpha is not bring back to the origin alpha although animation is removed */
    [_imageCat.layer removeAnimationForKey:ANIMATION_KEY_FADEOUT];
    [_imageCat setAlpha:1.0f];
}

#pragma mark - AnimateWithDuration
- (IBAction)didClickedAnimatedWithDuration:(id)sender {
    
}


@end
