//
//  MainViewController.m
//  UIControlTest
//
//  Created by qingyun on 15-2-9.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "MainViewController.h"
#import "LHViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"登陆";
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameLable = [[UITextField alloc]initWithFrame:CGRectMake(50, 180, 220, 44)];
    _nameLable.borderStyle = UITextBorderStyleRoundedRect;
    _nameLable.placeholder = @"请输入用户名";
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 57, 44)];
    UIImageView *leftLable = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"card_icon_arrow@2x"]];
    leftLable.frame = CGRectMake(18, 10, 24, 24);
    [leftView addSubview:leftLable];
    _nameLable.leftView = leftView;
    _nameLable.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:_nameLable];
    
    
    UITextField *pwd = [[UITextField alloc]initWithFrame:CGRectMake(50, 240, 220, 44)];
    pwd.borderStyle = UITextBorderStyleRoundedRect;
    pwd.placeholder = @"请输入密码";
    
    UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 57, 44)];
    UIImageView *rightLable = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"card_icon_unblock@2x"]];
    rightLable.frame = CGRectMake(18, 10, 24, 24);
    [rightView addSubview:rightLable];
    pwd.leftView = rightView;
    pwd.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:pwd];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(115, 300, 90, 45);
    [button setTitle:@"登陆" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchDown ];
    
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)button
{
    LHViewController *MainVC = [[LHViewController alloc]init];
    
    [self.navigationController pushViewController:MainVC animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
