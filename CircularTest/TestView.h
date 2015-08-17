//
//  TestView.h
//  CircularTest
//
//  Created by qtone_yzt on 15/7/24.
//  Copyright (c) 2015年 qtone_yzt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestView : UIView

{
    
    CAShapeLayer *layer;
    
    CADisplayLink *displayLink;
    
    CGFloat allTnterval;
    CGFloat curr;
}

- (void)playToEndInTime:(CGFloat)time;//在规定时间(秒)内转一圈
- (void)reSet;
- (void)stop;

- (void)setProgress:(CGFloat)progress;

@end
