//
//  SNSDeviceInstagram.m
//  SNSServices
//
//  Created by Joohae Kim on 2016. 3. 13..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "SNSDeviceInstagram.h"

@interface SNSDeviceInstagram ()
{
    AuthenticationWVCInstagram *_webviewController;
    NSString *_accessToken;
}

@property (nonatomic) NSString *clientId;
@property (nonatomic) NSString *clientSecret;
@property (nonatomic) NSString *callbackBase;

@end

@implementation SNSDeviceInstagram

- (void) setClinetID:(NSString *)clientId
              secret:(NSString *)clientSecret
     andCallbackBase:(NSString *)callbackBase {
    _clientId = clientId;
    _clientSecret = clientSecret;
    _callbackBase = callbackBase;
}

- (BOOL) hasAuthentication {
    if (!_accessToken) {
        _accessToken = [[NSUserDefaults standardUserDefaults] stringForKey:(NSString * _Nonnull)SNS_KEY_ACCESSTOKEN];
    }
    return (_accessToken != nil);
}

- (void) requestFileList {
    NSError *error;
    if (![self hasAuthentication]) {
        [self addAuthenticationViews];
    }
}


/// Internal Methods
#pragma mark - Authentication
- (void) addAuthenticationViews {
    UIViewController *parentVC = [self.delegate SNSWebAuthenticationRequired];

    NSString *frameworkBundleID = @"kr.carrotbooks.SNSServices";
    NSBundle *frameworkBundle = [NSBundle bundleWithIdentifier:frameworkBundleID];
    
    _webviewController = [[AuthenticationWVCInstagram alloc]
                          initWithNibName:@"AuthenticationWebViewController"
                          bundle:frameworkBundle];
    [_webviewController setDelegate:self];
    [_webviewController setClinetID:_clientId secret:_clientSecret andCallbackBase:_callbackBase];
    
    [parentVC addChildViewController:_webviewController];
    _webviewController.view.frame = parentVC.view.frame;

    [parentVC.view addSubview:_webviewController.view];
    [_webviewController didMoveToParentViewController:parentVC];
}

- (void) removeAuthenticationViews {
    [_webviewController.view removeFromSuperview];
    [_webviewController removeFromParentViewController];
    _webviewController = nil;
}

#pragma mark Authentication Delegate Methods
- (void) authenticationSuccess:(NSDictionary *)response {
    _accessToken = response[@"ACCESS_TOKEN"];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (_accessToken) {
            NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:_accessToken forKey:(NSString * _Nonnull)SNS_KEY_ACCESSTOKEN];
            
            [self removeAuthenticationViews];
            [self.delegate SNSWebAuthenticationSuccess];
        }
    });
}

- (void) authenticationFailure:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self removeAuthenticationViews];
        [self.delegate SNSWebAuthenticationFailed:error];
    });
}
@end
