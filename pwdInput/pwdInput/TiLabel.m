//
//  TiLabel.m
//  pwdInput
//
//  Created by Tinora on 2017/9/1.
//  Copyright © 2017年 Tinora. All rights reserved.
//

#import "TiLabel.h"

@implementation TiLabel

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

//        self.backgroundColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:15.f];
        self.textColor = [UIColor blackColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    if (selected) {
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }else{
        self.layer.borderColor = [UIColor blueColor].CGColor;
    }
}

-(void)addPoint{


}

-(void)removePoint{


}


@end
