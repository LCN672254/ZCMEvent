//
//  ZCMDemoOneViewController.m
//  ZCMEvent
//
//  Created by 梁城楠 on 2017/6/27.
//  Copyright © 2017年 YD. All rights reserved.
//

#import "ZCMDemoOneViewController.h"

@interface ZCMDemoOneViewController ()

@end

@implementation ZCMDemoOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    ZCMEvent *e = [[ZCMEvent alloc] init];
    e.eventID = ZCM_EVT_ONE;
    e.sender = self;
    [self postEvent:e];

}

- (BOOL) doEvent:(ZCMEvent *)event{
    
    BOOL handle = NO;
    
    if (event.eventID == ZCM_EVT_THREE) {
        
        CGFloat r = arc4random()%256/255.0;
        CGFloat g = arc4random()%256/255.0;
        CGFloat b = arc4random()%256/255.0;
        
        self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
        handle = YES;
        
    }
    
    return handle;
}


@end
