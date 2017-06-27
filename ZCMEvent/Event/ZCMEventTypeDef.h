//
//  ZCMEventTypeDef.h
//  NSProxyDemo
//
//  Created by 梁城楠 on 16/7/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#ifndef ZCMEventTypeDef_h
#define ZCMEventTypeDef_h

#endif /* ZCMEventTypeDef_h */

typedef enum : NSUInteger {
    ZCMEventLevelNormal = 200,
    ZCMEventLevelMindle = 201,
    ZCMEventLevelHight  = 202
} ZCMEventLevel;

typedef enum : NSUInteger {
    
    ZCMEventTypeNone = 0,
    ZCMEventTypeLive = 1,
    
} ZCMEventType;


typedef enum : NSUInteger {
    
    ZCM_EVT_NONE = 0,      //无事件
    ZCM_EVT_ONE ,
    ZCM_EVT_TWO ,
    ZCM_EVT_THREE,
    
} ZCMEventID;
