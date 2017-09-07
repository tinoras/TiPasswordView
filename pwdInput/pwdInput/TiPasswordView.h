//
//  TiPasswordView.h
//  pwdInput
//
//  Created by Tinora on 2017/9/7.
//  Copyright © 2017年 Tinora. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Normal_Color @""
#define Selected_Color @""

@interface TiPasswordView : UIView
@property (nonatomic,strong) UITextField * zeroText;
@property (nonatomic,copy) void (^block) (NSString *password);
@end
