//
//  ViewController.m
//  CountingDemo
//
//  Created by Ethan on 2017/6/6.
//  Copyright © 2017年 Ethan. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"heihei";
}

- (IBAction)buttonEvent:(UIButton *)sender {
    TestViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TestViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
