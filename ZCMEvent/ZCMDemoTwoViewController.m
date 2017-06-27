//
//  ZCMDemoTwoViewController.m
//  ZCMEvent
//
//  Created by 梁城楠 on 2017/6/27.
//  Copyright © 2017年 YD. All rights reserved.
//

#import "ZCMDemoTwoViewController.h"

@interface ZCMDemoTwoViewController ()

@end

@implementation ZCMDemoTwoViewController

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
    e.eventID = ZCM_EVT_THREE;
    e.sender = self;
    [self postEvent:e];
    
}

- (BOOL) doEvent:(ZCMEvent *)event{
    
    BOOL handle = NO;
    
    if (event.eventID == ZCM_EVT_TWO) {
        
        CGFloat r = arc4random()%256/255.0;
        CGFloat g = arc4random()%256/255.0;
        CGFloat b = arc4random()%256/255.0;
        
        self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
        handle = YES;
        
    }
    
    return handle;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
