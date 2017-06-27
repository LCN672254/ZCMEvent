//
//  ZCMBaseEventViewController.m
//  NSProxyDemo
//
//  Created by 梁城楠 on 16/7/18.
//  Copyright © 2016年 ZCM. All rights reserved.
//

#import "ZCMBaseEventViewController.h"

@implementation ZCMBaseEventViewController

- (BOOL) postEvent:(ZCMEvent *)event{
   
    self.fromChildEventViewController = nil;
     ZCMBaseEventViewController *parentViewController = (ZCMBaseEventViewController *)self.parentViewController;
    if ([parentViewController isKindOfClass:[ZCMBaseEventViewController class]]) {
        parentViewController.fromChildEventViewController = nil;
    }
    return [self respondsToEvent:event parentViewController:nil];
}

- (BOOL) respondsToEvent:(ZCMEvent *)event parentViewController:(ZCMBaseEventViewController *) parentViewController{

    BOOL result = NO;
    
    if (event.sender != self) {
     
        result = [self doEvent:event];
        
    }
    //子控制器是否响应事件，排除事件来源子控制器
    if (!result) {
        //子控制器是否响应事件
        result = [self childrenControllerRespondsToEvent:event againstChildController:_fromChildEventViewController];
    }
    //当自身及子控制器不响应时，上抛至父控制器且该事件不来自父控制器。
    if (!result && !parentViewController){
        //父节点是否响应事件
        result = [self parentViewControllerRespondsToEvent:event fromChildController:self];
    }
    
    return result;
    
}

- (BOOL) doEvent:(ZCMEvent *)event{
    
    return NO;
    
}

- (BOOL) childrenControllerRespondsToEvent:(ZCMEvent *)event againstChildController:(__kindof ZCMBaseEventViewController *)childEventViewController{
    NSArray * childrenController = self.childViewControllers;
    for (ZCMBaseEventViewController *child in childrenController) {
    
        if ([child  isKindOfClass:[ZCMBaseEventViewController class]] && child!= childEventViewController) {
            BOOL result = [child respondsToEvent:event parentViewController:self];
            if (result) {
                return result;
            }
        }
    }
    
    return NO;
}

- (void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
    
    NSArray *childrens = self.childViewControllers;
    
    if (childrens.lastObject == self) {
     
        for (UIViewController *vc in childrens) {
            [vc viewDidDisappear:NO];
            [vc.view removeFromSuperview];
            [vc removeFromParentViewController];
        }
    }
}

- (BOOL) parentViewControllerRespondsToEvent:(ZCMEvent *)event fromChildController:(__kindof ZCMBaseEventViewController *)fromChildEventViewController{

    ZCMBaseEventViewController *parentViewController = (ZCMBaseEventViewController *)self.parentViewController;
    
    BOOL result = NO;
    
    if ([parentViewController isKindOfClass:[ZCMBaseEventViewController class]]) {
    
        parentViewController.fromChildEventViewController = fromChildEventViewController;
        result =[parentViewController respondsToEvent:event parentViewController:nil];
        parentViewController.fromChildEventViewController = nil;
        
    }
    
    return result;
}

@end
