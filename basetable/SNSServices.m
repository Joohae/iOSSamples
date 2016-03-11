//
//  SNSServices.m
//  iOSSamples
//
//  Created by Joohae Kim on 2016. 3. 10..
//  Copyright © 2016년 Joohae Kim. All rights reserved.
//

#import "SNSServices.h"

@interface SNSServices()
{
    NSDictionary *_services;
    NSArray      *_serviceKeys;
}

@end

@implementation SNSServices

+(NSInteger)numberOfServices {
    return SNSServices.sharedManager.numberOfServices;
}

+(NSDictionary *)getServiceAt:(NSInteger)index {
    return [SNSServices.sharedManager getServiceAt:index];
}

#pragma mark - Sub-methods

-(NSInteger)numberOfServices {
    return _services.count;
}

-(NSDictionary *)getServiceAt:(NSInteger)index {
    return [_services objectForKey:[_serviceKeys objectAtIndex:index]];
}

#pragma mark - Singleton
-(id)init {
    if (self = [super init]) {
        _services = @{
                      @(SNSServiceInstagram): @{ SNSServiceTitle: @"Instagram",
                                                 SNSServiceIcon: @"icon-sns-instagram.png",
                                                 SNSServiceDescription: @"Instagram description" }
                      };
        _serviceKeys = [_services allKeys];
    };
    
    return self;
}

+(SNSServices *)sharedManager {
    static SNSServices *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

@end
