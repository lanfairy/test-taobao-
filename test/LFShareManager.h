//
//  LFShareManager.h
//  test
//
//  Created by 张俊伟 on 2016/12/24.
//  Copyright © 2016年 lanfairy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define  kHOMEURL  @"http://www.xiaofupo123.com"
@interface LFShareManager : NSObject
+ (LFShareManager *)sharedInstance;
-(void)shareSourceView:(UIView *)sourceView PresentViewController:(UIViewController*)pvc Url:(NSString*)shareUrl;
-(void)shareWithImage:(UIImage *)img APPUrl:(NSString *)shareUrl AndFrame:(CGRect)frame PresentToController:(UIViewController*)controller;
@end
