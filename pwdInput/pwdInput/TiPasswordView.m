//
//  TiPasswordView.m
//  pwdInput
//
//  Created by Tinora on 2017/9/7.
//  Copyright © 2017年 Tinora. All rights reserved.
//

#import "TiPasswordView.h"
#import "TiLabel.h"
@interface TiPasswordView ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
//@property (nonatomic,strong) UITextField * zeroText;
@property (nonatomic, strong) TiLabel *currentLabel;
@end
#define ViewTag_Number 123123
@implementation TiPasswordView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.zeroText = [[UITextField alloc] initWithFrame:CGRectZero];
        self.zeroText.delegate = self;
        self.zeroText.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:self.zeroText];
        [self.zeroText becomeFirstResponder];

        CGFloat orginlX = 40;
        CGFloat margin = 5;
        CGFloat viewWidth = 40;
        for (int i = 0; i< 6; i++) {
            //之所以用label 是因为可以直接显示数字  嫌麻烦可以就直接改成uiview
            TiLabel * label = [[TiLabel alloc] initWithFrame:CGRectMake(orginlX +i*(margin + viewWidth), 0, viewWidth, 46)];
            label.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            tap.delegate = self;
            [label addGestureRecognizer:tap];
            label.layer.cornerRadius = 4;
            label.layer.borderColor = [UIColor blackColor].CGColor;
            label.layer.borderWidth = .5;
            label.layer.masksToBounds = YES;
            label.backgroundColor = [UIColor whiteColor];
            label.tag = ViewTag_Number + i;
            if (i == 0) {
                label.layer.borderColor = [UIColor redColor].CGColor;
                self.currentLabel = label;
            }
            [self addSubview:label];
        }
    }
    return self;
}

-(void)tap:(UIGestureRecognizer *)ges{
    [self.zeroText becomeFirstResponder];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    NSLog(@"---textField=%@-----replaceStr=%@---%lu",textField.text,string,(unsigned long)range.location);
    //改变后的字符串
    NSString *currentString = [textField.text stringByAppendingString:string];
    if (currentString.length >6) {
        [textField resignFirstResponder];
    }
    //就是删除
    if ([string isEqualToString:@""]) {
        currentString =[textField.text substringToIndex:range.location];
        [self.currentLabel.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        self.currentLabel.layer.borderColor = [UIColor blackColor].CGColor;
        if (self.currentLabel.tag-ViewTag_Number) {
            TiLabel * preLabel = [self viewWithTag:self.currentLabel.tag - 1];
            preLabel.layer.borderColor = [UIColor redColor].CGColor;
            self.currentLabel = preLabel;
        }else{
            TiLabel * preLabel = [self viewWithTag:ViewTag_Number];
            [preLabel.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            preLabel.layer.borderColor = [UIColor redColor].CGColor;
            self.currentLabel = preLabel;
        }
    }
    //填写
    else{
        if (range.location<=5) {
            currentString = [textField.text stringByAppendingString:string];
            UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 6, 6)];
            pointView.backgroundColor = [UIColor blackColor];
            pointView.layer.cornerRadius = pointView.frame.size.width/2;
            [self.currentLabel addSubview:pointView];
            pointView.center = CGPointMake(self.currentLabel.frame.size.width/2, self.currentLabel.frame.size.height/2);
            self.currentLabel .layer.borderColor = [UIColor blackColor].CGColor;
            if (currentString.length >= 6) {
                self.currentLabel.layer.borderColor = [UIColor blackColor].CGColor;
                textField.text = currentString;
                [self.zeroText resignFirstResponder];
            }else{
                TiLabel * nextLabel = [self viewWithTag:range.location+1 + ViewTag_Number];
                nextLabel.layer.borderColor = [UIColor redColor].CGColor;
                self.currentLabel = nextLabel;
            }
        }
    }
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.text.length== 6) {
        TiLabel * currentLabel = [self viewWithTag:textField.text.length - 1 + ViewTag_Number];
        currentLabel.layer.borderColor = [UIColor redColor].CGColor;
        self.currentLabel = currentLabel;
    }
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField.text.length== 6) {
        TiLabel * currentLabel = [self viewWithTag:textField.text.length - 1 + ViewTag_Number];
        currentLabel.layer.borderColor = [UIColor blackColor].CGColor;
        self.currentLabel = currentLabel;
        self.block(textField.text);
    }
    return YES;
}
@end
