/*==========================================================================
 *
 * File Name: CircularProgressView.h
 *      Desc: 圆环进度
 *      Auth: luph
 *      Date: 2015/08/11
 *      Modi: 2015/08/11
 *
 *==========================================================================*/

#import <UIKit/UIKit.h>

@class CircularProgressView;

@protocol CircularProgressDelegate <NSObject>
@optional
- (void)circularProgressViewEndPlay:(CircularProgressView *)view;
@end

@interface CircularProgressView : UIView
{
    
    CAShapeLayer *layer;
    CAShapeLayer *backgroundLayer;
    CADisplayLink *displayLink;
    
    CGFloat allTnterval; //总次数
    CGFloat curr; //当前第几次
}

@property (nonatomic,assign)id<CircularProgressDelegate> delegate;

- (void)setBackColorColor:(UIColor*)color;
- (void)setProgressColor:(UIColor*)color;
- (void)setLineWith:(CGFloat)with;

- (void)playToEndInTime:(CGFloat)time;//在规定时间(秒)内转一圈
- (void)reSet; //重置
- (void)pause;//暂停
- (void)stop; //停止

- (void)setProgress:(CGFloat)progress;//设置进度[0-1]
@end
