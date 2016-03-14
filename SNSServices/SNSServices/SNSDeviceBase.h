//
//  SNSDeviceBase.h
//  iOSSamples
//
//  Created by Joohae Kim on 2016. 3. 10..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNSServiceDelegate.h"

typedef NS_ENUM(NSInteger, SNSSErviceError) {
    SNSServiceErrorOkay,                // No error
    SNSSErviceErrorUnimplemented        // Unimplemented method error
};

@interface SNSDeviceBase : NSObject

@property (nonatomic,weak) id<SNSServiceDelegate> delegate;

/*!
 Request request media file list to SNSService
 */
- (void) requestFileList;

@end
