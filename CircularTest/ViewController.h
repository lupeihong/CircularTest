//
//  ViewController.h
//  CircularTest
//
//  Created by bluefish on 15/7/24.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CircularProgressView.h"

@interface ViewController : UIViewController
{
    CADisplayLink *displayLink;
    CircularProgressView *excellentView;
}
@end

