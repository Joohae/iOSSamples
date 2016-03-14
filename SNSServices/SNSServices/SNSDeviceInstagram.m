//
//  SNSDeviceInstagram.m
//  SNSServices
//
//  Created by Joohae Kim on 2016. 3. 13..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "SNSDeviceInstagram.h"

@interface SNSDeviceInstagram ()

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

@end
