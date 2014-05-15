//
//  ViewController.m
//  DevDiv_ActivityViewController_Demo
//
//  Created by BeyondVincent on 12-6-20.
//  Copyright (c) 2012年 DevDiv. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// 测试UIActivityViewController
- (IBAction)ActivityVCAction:(id)sender
{
    // 首先初始化activityItems参数
    NSArray *activityItems = [[NSArray alloc]initWithObjects:
                              @"移动开发技术尽在DevDiv移动技术开发社区",
                              @"http://www.DevDiv.com",
//                              [UIImage imageNamed:@"background1.png"],
                              [UIImage imageNamed:@"background1.png"],nil];
    
    // 初始化一个UIActivityViewController
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:Nil];
    
    // 写一个bolck，用于completionHandler的初始化
    UIActivityViewControllerCompletionHandler myBlock = ^(NSString *activityType, BOOL completed) {
        NSLog(@"%@", activityType);
        if (completed)
        {
            NSLog(@"completed");
        } else
        {
            NSLog(@"cancled");
        }
        [activityVC dismissViewControllerAnimated:YES completion:Nil];
    };
    
    // 初始化completionHandler，当post结束之后（无论是done还是cancell）该blog都会被调用
    activityVC.completionHandler = myBlock;
    
    // 以模态方式展现出UIActivityViewController
    [self presentViewController:activityVC animated:YES completion:Nil];
}


@end
