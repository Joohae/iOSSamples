//
//  SNSServices.h
//  iOSSamples
//
//  Created by Joohae Kim on 2016. 3. 10..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SNSServiceTitle         @"TITLE"
#define SNSServiceIcon          @"ICON"
#define SNSServiceDescription   @"DESCRIPTION"

typedef NS_ENUM(NSInteger, SNSServicesType) {
    SNSServiceInstagram
};

@interface SNSServices : NSObject

+(NSInteger)numberOfServices;
+(NSDictionary *)getServiceAt:(NSInteger)index;

@end
