//
//  ZCMBaseEventViewController.h
//  NSProxyDemo
//
//  Created by 梁城楠 on 16/7/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//


/*
   在开发直播过程中，直播界面面板负责，多种功能集合在其中，其中主播端，客户端，除部分功能不同外绝大部分模块功能相同。
   为了减低耦合度，不同功能做成单一控制器控制，例如推流控制器，拉流控制器，IM控制器，以及一些类似于刷礼物等等功能的控制器。
   将多个controller，集成在同一个控制器，就会有一个问题，就是不同控制器之间的通讯问题。例如IM控制器中，后台会下发一些特殊的指令消息，来控制APP的一些行为，比如禁言，踢出违规用户等等。因此，我们自定义了Event事件，当然不是系统的事件。来处理这些问题。该方案依旧适用于，多控制器集成在一起的复杂逻辑。直播、视频播放控制面板等。
 
    注意如果是当前控制发送指令，响应者也为当前控制器，则这时间是不会被响应的。在当前控制器中，不需要该方案，当然要是无聊也可改写下，支持
 
 */


#import <UIKit/UIKit.h>
#import "ZCMEvent.h"

@interface ZCMBaseEventViewController : UIViewController

@property (nonatomic,weak) ZCMBaseEventViewController *fromChildEventViewController;


/**
 自身是否响应控制事件

 @param event 事件
 @param parentViewController 父控制器
 @return 是否处理
 */
- (BOOL) respondsToEvent:(ZCMEvent *)event parentViewController:(ZCMBaseEventViewController *) parentViewController;

/**
 该控制的自控制是否响应事件

 @param event 事件
 @param childEventViewController 如果事件来自于子控制中，只检测该控制器的其他子控制器，事件来源控制器不再检测
 @return 是否响应
 */
- (BOOL) childrenControllerRespondsToEvent:(ZCMEvent *)event againstChildController:(__kindof ZCMBaseEventViewController *) childEventViewController;


/**
 该控制器的父控制器是否响应事件

 @param event 事件
 @param fromChildEventViewController 来源
 @return 是否处理
 */
- (BOOL) parentViewControllerRespondsToEvent:(ZCMEvent *)event fromChildController:(__kindof ZCMBaseEventViewController *) fromChildEventViewController;

//+ (instancetype) sharePermissionManager;

/**
 控制器发送Event

 @param event 事件
 @return 是否已处理，如果已处理则不再向下触发
 */
- (BOOL) postEvent:(ZCMEvent *)event;

/**
 *  响应事件
 *  @param event 事件，如果要处理事件则根据event返回YES
 */
- (BOOL) doEvent:(ZCMEvent *)event;

@end
