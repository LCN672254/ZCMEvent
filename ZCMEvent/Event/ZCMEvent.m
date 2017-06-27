//
//  ZCMEvent.m
//  NSProxyDemo
//
//  Created by 梁城楠 on 16/7/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import "ZCMEvent.h"

@implementation ZCMEvent

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _eventID =  ZCM_EVT_NONE;
        _eventType = ZCMEventTypeNone;
    }
    
    return self;
}

@end
