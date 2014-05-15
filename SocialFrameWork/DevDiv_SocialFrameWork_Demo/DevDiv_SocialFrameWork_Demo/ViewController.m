//
//  ViewController.m
//  DevDiv_SocialFrameWork_Demo
//
//  Created by BeyondVincent on 12-6-18.
//  Copyright (c) 2012年 DevDiv. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize postUrl;
@synthesize postImage;
@synthesize postText;

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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

// 发送新浪微博
- (IBAction)WeiboAction:(id)sender
{    
    // 首先判断服务器是否可以访问
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        NSLog(@"Available");
        
        // 使用SLServiceTypeSinaWeibo来创建一个新浪微博view Controller
        SLComposeViewController *socialVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];

        // 写一个bolck，用于completionHandler的初始化
        SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultCancelled) {
                NSLog(@"cancelled");
            } else
            {
                NSLog(@"done");
            }
            [socialVC dismissViewControllerAnimated:YES completion:Nil];
        };
        // 初始化completionHandler，当post结束之后（无论是done还是cancell）该blog都会被调用
        socialVC.completionHandler = myBlock;

        // 给view controller初始化默认的图片，url，文字信息
        UIImage *image = [UIImage imageNamed:postImage.text];
        NSURL *url = [NSURL URLWithString:postUrl.text];
        
        [socialVC setInitialText:postText.text];
        [socialVC addImage:image];
        [socialVC addURL:url];

        // 以模态的方式展现view controller
        [self presentViewController:socialVC animated:YES completion:Nil];

    } else {
        NSLog(@"UnAvailable");
    }
}
@end
