//
//  ViewController.h
//  DevDiv_SocialFrameWork_Demo
//
//  Created by BeyondVincent on 12-6-18.
//  Copyright (c) 2012年 DevDiv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *postUrl;
@property (weak, nonatomic) IBOutlet UITextField *postImage;
@property (weak, nonatomic) IBOutlet UITextView *postText;
- (IBAction)WeiboAction:(id)sender;

@end
