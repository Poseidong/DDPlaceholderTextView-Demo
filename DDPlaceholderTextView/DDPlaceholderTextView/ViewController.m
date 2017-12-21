//
//  ViewController.m
//  DDPlaceholderTextView
//
//  Created by Poseidon on 2017/12/12.
//  Copyright © 2017年 Poseidon. All rights reserved.
//

#import "ViewController.h"
#import "DDPlaceholderTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    DDPlaceholderTextView *textView = [[DDPlaceholderTextView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    textView.placeHolder = @"Hello World";
    [self.view addSubview:textView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
