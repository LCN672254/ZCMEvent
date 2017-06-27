//
//  ZCMEvent.h
//  NSProxyDemo
//
//  Created by 梁城楠 on 16/7/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "ZCMEventTypeDef.h"
@interface ZCMEvent : NSObject

@property (nonatomic,assign) ZCMEventType eventType;
@property (nonatomic,assign) ZCMEventID eventID;
@property (nonatomic,assign) ZCMEventLevel eventLevel;
@property (nonatomic,strong) NSDictionary *parameters; //参数
@property (nonatomic,weak) id sender;             //事件发送者

@end
