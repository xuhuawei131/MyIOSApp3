//
//  ViewController.m
//  MyIOSApp3
//
//  Created by lingdian on 17/8/25.
//  Copyright © 2017年 lingdian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *sliderValue;
@property (weak, nonatomic) IBOutlet UILabel *labelProgress;
@property (weak, nonatomic) IBOutlet UITextField *editText;
@property (weak, nonatomic) IBOutlet UIStepper *stepperView;

@end

@implementation ViewController
- (IBAction)onSlideChange:(id)sender {
    UISlider* s=(UISlider*)sender;

    float values=s.value;
    
    [self updateProgress:values];
    
//    NSString* formatStr=[[NSString alloc]initWithFormat:@"%.3f",values ];
//    //设置标签以及输入框数据
//    self.labelProgress.text=formatStr;
//    self.editText.text=formatStr;
    
}
- (IBAction)OnEditingDidEnd:(id)sender {
    
}

-(void)updateProgress:(float)values{
    
    NSString* formatStr=[[NSString alloc]initWithFormat:@"%.3f",values ];
    //设置标签以及输入框数据
    self.labelProgress.text=formatStr;
    self.editText.text=formatStr;
    self.stepperView.value=values;
    self.sliderValue.value=values;
    
}

//加减号控件 的 valuechange回调函数
- (IBAction)onPlusOrMinuChange:(id)sender {
    UIStepper* stepper=(UIStepper*)sender;
    
    
    //当前值
    int values=stepper.value;
    
    [self updateProgress:values];
    
}

- (IBAction)onEditChangeByConfirm:(id)sender {
    //强制转化成UITextField＊类型
    UITextField* editText=(UITextField*)sender;
    float values=[editText.text floatValue];
    //设置进度条进度
    [self.sliderValue setValue:values];
//    self.sliderValue.value=values;
    //当前值
    self.stepperView.value = values;
//    self.stepperView setValue＝10;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //在这里进行初始化拖动进度条
    [self.sliderValue setMaximumValue:1000];
    [self.sliderValue setMinimumValue:0];
    
    //初始化label的显示
    self.labelProgress.text=@"";
    
    //初始化UIStepper
    //最小值，默认为0
    self.stepperView.minimumValue = 0;
    //最大值，默认为100
    self.stepperView.maximumValue = 1000;
    //步进值
    self.stepperView.stepValue = 2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
