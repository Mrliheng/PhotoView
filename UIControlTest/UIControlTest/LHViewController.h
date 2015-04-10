//
//  LHViewController.h
//  UIControlTest
//
//  Created by qingyun on 15-2-5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHViewController : UIViewController<UITextFieldDelegate>
@property (strong,nonatomic)UITextField *text;
@property (strong,nonatomic)UIPageControl *page;
@property int step;
@property (strong, nonatomic) UISlider *slider;

@end
