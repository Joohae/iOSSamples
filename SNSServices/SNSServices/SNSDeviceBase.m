//
//  SNSDeviceBase.m
//  iOSSamples
//
//  Created by Joohae Kim on 2016. 3. 10..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "SNSDeviceBase.h"

@implementation SNSDeviceBase

/*!
 Request request media file list to SNSService
 */
- (void) requestFileList {
    NSError *error;
    error = [NSError errorWithDomain:@"kr.carrotbooks.SNSServices"
                                code:SNSSErviceErrorUnimplemented
                            userInfo:@{
                                       NSLocalizedDescriptionKey: @"Unimplemented method requestFileList"
                                       }];

    if (self.delegate && [self.delegate respondsToSelector:@selector(SNSServiceError:)]) {
        [self.delegate SNSServiceError:error];
    } else {
        NSLog(@"SNSSErvice internal error: %@", [[error userInfo] valueForKey:NSLocalizedDescriptionKey]);
    }
}

@end
