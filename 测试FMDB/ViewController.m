//
//  ViewController.m
//  测试FMDB
//
//  Created by beike柯 on 16/3/16.
//  Copyright © 2016年 beike柯. All rights reserved.
//

#import "ViewController.h"
#import "DataBase.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [DataBase sharedInstance];
}

@end
