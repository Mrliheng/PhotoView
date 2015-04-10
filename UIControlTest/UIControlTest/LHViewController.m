//
//  LHViewController.m
//  UIControlTest
//
//  Created by qingyun on 15-2-5.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "LHViewController.h"

@interface LHViewController ()

@end


@implementation LHViewController





- (void)viewDidLoad
{
    
   
    [super viewDidLoad];
    //输入确定按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundColor:[UIColor redColor]];
    button1.frame = CGRectMake(180, 20, 40, 25);
    [button1 setTitle:@"确定" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(button1:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
    
    
    //上一页
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(40, 220, 40, 40);
    [button2 setImage:[UIImage imageNamed:@"preview_arrowleft_icon@2x"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(button2:) forControlEvents:UIControlEventTouchDown];
    button2.tag = 1004;
    [self.view addSubview:button2];
    
    
    //下一页
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(250, 220, 40, 40);
    [button3 setImage:[UIImage imageNamed:@"preview_arrowright_icon@2x"] forState:UIControlStateNormal];
    button3.tag = 1005;
    [button3 addTarget:self action:@selector(button3:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button3];
    
    
    //开始按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(self.view.bounds.size.width/2-60, 120, 120, 44);
    [button setTitle:@"开始" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    
    
    //文本框
    _text = [[UITextField alloc]initWithFrame:CGRectMake(40, 20, 120, 25)];
    _text.borderStyle = UITextBorderStyleLine;
    _text.textColor = [UIColor purpleColor];
    _text.placeholder = @"请输入0~5";
    _text.backgroundColor = [UIColor whiteColor];
    _text.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _text.keyboardAppearance = UIKeyboardAppearanceDark;
    _text.clearButtonMode = UITextFieldViewModeAlways;
    _text.returnKeyType = UIReturnKeyGo;
    _text.tag = 1001;
    _text.delegate = self;
    [self.view addSubview: _text];
    
    
    //UISegmentedControl
    UISegmentedControl *segement = [[UISegmentedControl alloc]initWithItems:@[@"浏览器",@"简介"]];
    segement.frame = CGRectMake(130, 400, 80, 30);
    [segement addTarget:self action:@selector(segment:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segement];
    
    

    //开关按钮
    UISwitch *mySwitch = [[UISwitch alloc]initWithFrame:CGRectMake(260, 20, 0, 0)];
    mySwitch.onTintColor = [UIColor redColor];
    
    [mySwitch setOn:NO animated:YES];
    [mySwitch addTarget:self action:@selector(swit:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:mySwitch];
    
    
    //分页
    _page = [[UIPageControl alloc]initWithFrame:CGRectMake(110, 450, 100, 20)];
    _page.backgroundColor = [UIColor whiteColor];
    _page.numberOfPages = 6;
    _page.hidesForSinglePage = NO;
    _page.currentPageIndicatorTintColor = [UIColor redColor];
    _page.pageIndicatorTintColor = [UIColor brownColor];
    _page.tag =1003;
    [_page addTarget:self action:@selector(page:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_page];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 120, 120)];
    image.tag = 1008;
    [self.view addSubview:image];
    
    //滑动条
    _slider = [[UISlider alloc]initWithFrame:CGRectMake(20, 80, 280, 10)];
    _slider.minimumValue = 0;
    _slider.maximumValue = 5;

    [_slider addTarget:self  action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    _slider.tag = 101;
    
    
    [self.view addSubview:_slider];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//开始按钮的控制方法
-(void)button:(UIButton *)sender
{
    if (sender.isSelected) {
        sender.selected = NO;
    } else {
        sender.selected = YES;
    }
    

    UIImageView *image1 = (UIImageView *)[self.view viewWithTag:1008];
    image1.image =[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_step]];
    [self.view addSubview:image1];
    _slider.value = _step;
    _page.currentPage = _step;
     [_slider setValue:_step animated:YES];
      _step++;
    while (_step>5) {
        _step = 0;
    }

}
//确定按钮关联的控制方法
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location == 0 &&[string isEqualToString:@"0"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"不能以0开始！！！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好", nil];
        [alert show];

        return NO;
    }
    
    return YES;
}
-(void)button1:(UIButton *)sender
{
    UITextField *textField = (UITextField *)[self.view viewWithTag:1001];
    if ([textField.text intValue] >=0 && [textField.text intValue]<=5) {
        _page.currentPage =[textField.text intValue];
        _slider.value =[textField.text intValue];
        
        UIImageView *image1 = (UIImageView *)[self.view viewWithTag:1008];
        image1.image =[UIImage imageNamed:[NSString stringWithFormat:@"%.0f.png",_slider.value]];
        [self.view addSubview:image1];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"请输入0~5！！！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"好", nil];
        [alert show];
    }
    if (textField.isFirstResponder) {
        [textField resignFirstResponder];
    } else {
        [textField becomeFirstResponder];
    }
    
    
}
//上一页的控制方法
-(void)button2:(UIButton *)sender
{

    while (_step<0) {
        _step = 5;
    }
      _step--;
       _page.currentPage = _step;
    _slider.value = _step;
    
    UIImageView *image1 = (UIImageView *)[self.view viewWithTag:1008];
    image1.image =[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_step]];
    [self.view addSubview:image1];

}
//下一页的控制方法
-(void)button3:(UIButton *)sender
{
    
    
    while (_step>5) {
        _step = 0;
    }
    _step++;
    _page.currentPage = _step;
    _slider.value = _step;
    
    UIImageView *image1 = (UIImageView *)[self.view viewWithTag:1008];
    image1.image =[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_step]];
    [self.view addSubview:image1];
    
}

//滑动条的控制方法
- (void)sliderChange:(UISlider *)sender
{

    _page.currentPage = (int)sender.value;
    UIImageView *image1 = (UIImageView *)[self.view viewWithTag:1008];
    image1.image =[UIImage imageNamed:[NSString stringWithFormat:@"%.0f.png",sender.value]];
    [self.view addSubview:image1];
}
-(void)swit:(UISwitch *)sender
{
    if (sender.isOn) {
        
        self.view.alpha = 0.5;
        self.view.backgroundColor = [UIColor blackColor];
    } else {
        self.view.alpha = 1;
        self.view.backgroundColor = [UIColor whiteColor];
    }

}


-(void)segment:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == YES) {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 120, 120)];
        lable.backgroundColor = [UIColor yellowColor];
        lable.text = @"   图片在桌面，想看美女，请自己查找";
        lable.lineBreakMode = NSLineBreakByTruncatingHead;
        lable.numberOfLines = 0;
        [self.view addSubview:lable];

    }
    else{
        UIImageView *image1 = (UIImageView *)[self.view viewWithTag:1008];
        image1.image =[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",_step]];
        [self.view addSubview:image1];
    }
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController setToolbarHidden:NO];
}

//分页的控制方法
-(void)page:(UIPageControl *)sender
{
    _slider.value = sender.currentPage ;
    
    UISlider *sli = (UISlider *)[self.view viewWithTag:101];
    [self.view addSubview:sli];

    UIImageView *image1 = (UIImageView *)[self.view viewWithTag:1008];
    image1.image =[UIImage imageNamed:[NSString stringWithFormat:@"%.0f.png",_slider.value]];
    [self.view addSubview:image1];
}

@end
