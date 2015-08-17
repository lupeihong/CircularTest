//
//  ViewController.m
//  CircularTest
//
//  Created by qtone_yzt on 15/7/24.
//  Copyright (c) 2015年 qtone_yzt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    TestView *view;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    view=[[TestView alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
    [self.view addSubview:view];
    
//    [view strokeStart:0];
//    [view strokeEnd:0];
    
    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 30)];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn.selected=YES;
    [self.view addSubview:btn];

    
}

- (void)click:(id)sender{
    UIButton *btn=sender;
    if (btn.selected) {
         [view playToEndInTime:3];
    }else{
        [view stop];
        [view reSet];
        
    }
    btn.selected=!btn.selected;
   
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
