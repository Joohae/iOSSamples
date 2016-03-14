//
//  AuthenticationWVCInstagram.m
//  SNSServices
//
//  Created by Joohae Kim on 2016. 3. 13..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "AuthenticationWVCInstagram.h"

@interface AuthenticationWVCInstagram ()

@property (nonatomic) NSString *clientId;
@property (nonatomic) NSString *clientSecret;
@property (nonatomic) NSString *callbackBase;

@end

@implementation AuthenticationWVCInstagram

- (void)viewDidLoad {
    self.targetURL = @"https://www.instagram.com";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public methods
- (void) setClinetID:(NSString *)clientId
              secret:(NSString *)clientSecret
     andCallbackBase:(NSString *)callbackBase {
    _clientId = clientId;
    _clientSecret = clientSecret;
    _callbackBase = callbackBase;
}

@end
