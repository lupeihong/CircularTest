//
//  TestView.m
//  CircularTest
//
//  Created by qtone_yzt on 15/7/24.
//  Copyright (c) 2015年 qtone_yzt. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:
            CGPointMake(self.frame.size.height / 2.0f,self.frame.size.height / 2.0f)
            radius:self.frame.size.height / 2.f
            startAngle:-M_PI_2
            endAngle:M_PI_2+M_PI
            clockwise:YES];
//        path.lineCapStyle = kCGLineCapRound; //线条拐角
//        path.lineJoinStyle = kCGLineCapRound; //终点处理
        
        //背景圆圈
        CAShapeLayer *backgroundLayer =[CAShapeLayer layer];
        backgroundLayer = [CAShapeLayer layer];
        backgroundLayer.frame = self.bounds;
        backgroundLayer.lineWidth     = 10.0f;// 线条宽度
        backgroundLayer.strokeColor   = [UIColor grayColor].CGColor;   // 边缘线的颜色
        backgroundLayer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
        backgroundLayer.lineCap       = kCALineCapRound;               // 边缘线的类型
        backgroundLayer.path          = path.CGPath;                    // 从贝塞尔曲线获取到形状
        [self.layer addSublayer:backgroundLayer];
        
        
        layer = [CAShapeLayer layer];
        layer.frame = self.bounds;
        layer.strokeColor   = [UIColor greenColor].CGColor;   // 边缘线的颜色
        layer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
        layer.lineCap       = kCALineCapRound;               // 边缘线的类型
        layer.lineJoin      = kCALineJoinRound;
        layer.path          = path.CGPath;                    // 从贝塞尔曲线获取到形状
        layer.lineWidth     = 10.0f;                           // 线条宽度
//        layer.strokeStart   = 0.0f;
        layer.strokeEnd     = 0;
        
        [self.layer addSublayer:layer];
        
        
        
    }
    return self;
}


- (void)playToEndInTime:(CGFloat)time{
    CGFloat frameInterval=60;//频率
//    CGFloat time=3;//秒
    allTnterval=time*frameInterval; //总调用次数
    curr=0; //当前次
    
    [self play];
}


- (void)play{

    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateProgressCircle)];
    displayLink.frameInterval = 1;
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    
}

//重置
- (void)reSet{
    curr=0;
    [self setProgress:0];
}

- (void)stop{
    if (displayLink) {
        [displayLink invalidate];
        displayLink = nil;
    }
}

- (void)updateProgressCircle{
    
    if (curr==allTnterval) {
        [self stop];
        return;
    }
    
    curr++;
    
    [self setProgress:curr/allTnterval];
}


- (void)setProgress:(CGFloat)progress{
    if (progress == 0) {
        layer.hidden = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            layer.strokeEnd = 0;
        });
    }else {
        layer.hidden = NO;
        layer.strokeEnd = progress;
    }
}

@end
