//
//  ViewController.m
//  CircularTest
//
//  Created by qtone_yzt on 15/7/24.
//  Copyright (c) 2015年 qtone_yzt. All rights reserved.
//

#import "ViewController.h"

#define BRELEASE(obj){}        if(obj)[obj release];obj=nil;
#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc{
    BRELEASE(excellentView);
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    view=[[TestView alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
//    [self.view addSubview:view];
//
    excellentView=[[CircularProgressView alloc] initWithFrame:CGRectMake(40, 40, 100, 100)];
    [excellentView setLineWith:9];
    [excellentView setBackColorColor:Color(9, 137, 238, 1)];
    [excellentView setProgressColor:Color(174, 255, 176, 1)];
    [self.view addSubview:excellentView];
    
    

    UIButton *btn=[[UIButton alloc] initWithFrame:CGRectMake(excellentView.frame.origin.x, 400, 100, 30)];
    [btn setTitle:@"3秒转完" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    btn.selected=YES;
    [self.view addSubview:btn];
    [btn release];
    
    UIButton *btn1=[[UIButton alloc] initWithFrame:CGRectMake(btn.frame.origin.x+100+100, 400, 100, 30)];
    [btn1 setTitle:@"转至一半" forState:UIControlStateNormal];
    btn1.backgroundColor=[UIColor redColor];
    [btn1 addTarget:self action:@selector(clickToHalf) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [btn1 release];
    
}

- (void)click:(id)sender{
    UIButton *btn=sender;
    if (btn.selected) {
         [excellentView playToEndInTime:3];
    }else{
        [excellentView stop];
        [excellentView reSet];
        
    }
    btn.selected=!btn.selected;
   
}

- (void)clickToHalf{
    [excellentView setProgress:0.5];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
