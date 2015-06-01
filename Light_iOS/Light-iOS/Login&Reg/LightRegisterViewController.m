//
//  LightRegisterViewController.m
//  Light-iOS
//
//  Created by FLY on 15/5/31.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import "LightRegisterViewController.h"
#import "LightTextField.h"

@interface LightRegisterViewController ()

@property (nonatomic,strong) UILabel *banner;
@property (nonatomic,strong) LightTextField *registerNum;
@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIButton *continueButton;
@property (nonatomic,strong) UIButton *registerButton;

@end

@implementation LightRegisterViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
    [self.view addSubview:self.backgroundImageView];

    [self.view addSubview:self.banner];
    [self.view addSubview:self.registerNum];
    [self.view addSubview:self.continueButton];
    [self.view addSubview:self.registerButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImageView *)backgroundImageView{
    if(_backgroundImageView==nil){
        _backgroundImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        _backgroundImageView.image = [UIImage imageNamed:@"login_background"];
    }
    return _backgroundImageView;
}

-(UILabel *)banner{
    if(_banner == nil){
//        _banner = [[UILabel alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetHeight(self.view.frame)/4, _banner.text.length,TextFieldHeight/2)];
        _banner = [[UILabel alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetHeight(self.view.frame)/4, CGRectGetWidth(self.registerNum.frame)/2, 10)];
        _banner.text = @"请输入手机号:";
        _banner.textColor = [UIColor redColor];
        _banner.font = [UIFont systemFontOfSize:15];
        _banner.textAlignment=UIControlContentHorizontalAlignmentLeft;
    }
    return _banner;
}

-(LightTextField *)registerNum{
    if (_registerNum == nil){
        _registerNum = [[LightTextField alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetHeight(self.view.frame)/4+4*VerticalSpacing, CGRectGetWidth(self.view.frame)-HorizontalSpacing*2, TextFieldHeight)];
        _registerNum.background=[[UIImage imageNamed:@"operationbox_text"]stretchableImageWithLeftCapWidth:10 topCapHeight:15];
        _registerNum.horizontalPadding = TextFieldPadding;
        _registerNum.verticalPadding = TextFieldPadding;
        _registerNum.delegate = self;
        _registerNum.returnKeyType = UIReturnKeyDefault;
        _registerNum.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _registerNum;
}

-(UIButton *)continueButton {
    if(_continueButton == nil){
        _continueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _continueButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.registerNum.frame)+CGRectGetWidth(self.registerNum.frame)/6, CGRectGetMaxY(self.registerNum.frame)+4*VerticalSpacing,CGRectGetWidth(self.registerNum.frame)*2/3 , TextFieldHeight)];
        [_continueButton setTitle:@"继续" forState:UIControlStateNormal];
        [_continueButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
        [_continueButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateDisabled];
        [_continueButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
        _continueButton.enabled = YES;
        [_continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _continueButton;
}

-(UIButton *)registerButton {
    if(_registerButton == nil){
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.registerNum.frame)+CGRectGetWidth(self.registerNum.frame)/6, CGRectGetMaxY(self.continueButton.frame)+VerticalSpacing,CGRectGetWidth(self.registerNum.frame)*2/3 , TextFieldHeight)];
        [_registerButton setTitle:@"使用电子邮箱注册" forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateDisabled];
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
        _registerButton.enabled = YES;
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _registerButton;
}


-(void)closeKeyboard:(id)sender{
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
