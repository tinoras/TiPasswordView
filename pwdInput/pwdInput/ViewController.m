//
//  ViewController.m
//  pwdInput
//
//  Created by Tinora on 2017/8/31.
//  Copyright © 2017年 Tinora. All rights reserved.
//

#import "ViewController.h"
#import "TiPasswordView.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    TiPasswordView * view = [[TiPasswordView alloc] initWithFrame:CGRectMake(20, 300, [UIScreen mainScreen].bounds.size.width-40, 46)];
    view.block = ^(NSString *password) {
        NSLog(@"-----password---%@",password);
    };
    [self.view addSubview:view];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
