//
//  ViewController.m
//  ZCMEvent
//
//  Created by 梁城楠 on 2017/6/27.
//  Copyright © 2017年 YD. All rights reserved.
//

/*
  该实例中，包含了父控制器，调用子控制，亦有子控制调用父控制，以及同级子控制之间调用。实例通过改变背景颜色，来实现了ZCMEvent逻辑
 
 */

#import "ViewController.h"
#import "ZCMDemoOneViewController.h"
#import "ZCMDemoTwoViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *onebgView;
@property (weak, nonatomic) IBOutlet UIView *twobgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
       
        __strong typeof(weakSelf) strongWeak = weakSelf;
        
        ZCMDemoOneViewController * one =  [[ZCMDemoOneViewController alloc] initWithNibName:@"ZCMDemoOneViewController" bundle:[NSBundle mainBundle]];
        ZCMDemoTwoViewController * two =  [[ZCMDemoTwoViewController alloc] initWithNibName:@"ZCMDemoTwoViewController" bundle:[NSBundle mainBundle]];
        
        [strongWeak addChildViewController:one inView:strongWeak.onebgView];
        [strongWeak addChildViewController:two inView:strongWeak.twobgView];
        
    });
}

- (void) addChildViewController:(UIViewController *)childController inView:(UIView *)view{

    CGRect frame = view.bounds;
    childController.view.frame = frame;
    [view addSubview:childController.view];
    [self addChildViewController:childController];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    ZCMEvent *e = [[ZCMEvent alloc] init];
    e.eventID = ZCM_EVT_TWO;
    e.sender = self;
    [self postEvent:e];
    
}

- (BOOL) doEvent:(ZCMEvent *)event{

    BOOL handle = NO;

    if (event.eventID == ZCM_EVT_ONE) {
        
        CGFloat r = arc4random()%256/255.0;
        CGFloat g = arc4random()%256/255.0;
        CGFloat b = arc4random()%256/255.0;
        
        self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
        
        handle = YES;
        
    }
    
    return handle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
