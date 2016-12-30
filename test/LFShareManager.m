//
//  LFShareManager.m
//  test
//
//  Created by 张俊伟 on 2016/12/24.
//  Copyright © 2016年 lanfairy. All rights reserved.
//

#import "LFShareManager.h"



@implementation LFShareManager
-(void)shareSourceView:(UIView *)sourceView PresentViewController:(UIViewController*)pvc Url:(NSString*)shareUrl {
    
    NSString *textToShare = @"小富婆优惠券";
    UIImage *imageToShare = [UIImage imageNamed:@"wwwxiaofupo123"];
    NSString *urlStr = ([shareUrl isEqualToString:kHOMEURL] ? @"http://a.app.qq.com/o/simple.jsp?pkgname=com.youhuijuan" : shareUrl);
    
    NSURL *urlToShare = [NSURL URLWithString:urlStr];
    NSArray *activityItems = @[textToShare, imageToShare, urlToShare];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    
 
    activityVC.completionWithItemsHandler = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError) {
        NSLog(@"activityType :%@", activityType);
        if (completed)
        {
            NSLog(@"completed");
        }
        else
        {
            NSLog(@"cancel");
        }
        
    };
    activityVC.excludedActivityTypes = @[UIActivityTypeSaveToCameraRoll,UIActivityTypeOpenInIBooks,UIActivityTypeAirDrop,UIActivityTypeAssignToContact,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypePostToTwitter,UIActivityTypePostToFacebook];
    
    UIPopoverPresentationController *popover = activityVC.popoverPresentationController;
    if (popover) {
        popover.permittedArrowDirections = UIPopoverArrowDirectionDown;
        popover.sourceView = sourceView;
    }
    
    
    
    [pvc presentViewController:activityVC animated:YES completion:^{
        
    }];
}

-(void)shareWithImage:(UIImage *)img APPUrl:(NSString *)shareUrl AndFrame:(CGRect)frame PresentToController:(UIViewController*)controller
{
//    NSURL *urlToShare = [NSURL URLWithString:url];
//    NSArray *activityItems = [NSArray arrayWithObjects:urlToShare,img, nil];
    NSString *textToShare = @"小富婆优惠券";
    UIImage *imageToShare = [UIImage imageNamed:@"wwwxiaofupo123"];
    NSString *urlStr = ([shareUrl isEqualToString:kHOMEURL] ? @"http://a.app.qq.com/o/simple.jsp?pkgname=com.youhuijuan" : shareUrl);
    
    NSURL *urlToShare = [NSURL URLWithString:urlStr];
    NSArray *activityItems = @[textToShare, imageToShare, urlToShare];
    UIActivityViewController *activityViewController =[[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                                        applicationActivities:nil];
    activityViewController.modalTransitionStyle =UIModalTransitionStyleFlipHorizontal;
    activityViewController.excludedActivityTypes = @[UIActivityTypePrint,UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToVimeo,UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks];
    [activityViewController supportedInterfaceOrientations];
    if (activityViewController) {
        if (INTERFACE_IDIOM_IS_PAD) {
            UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:activityViewController];
            [popup presentPopoverFromRect:frame inView:controller.view permittedArrowDirections:UIPopoverArrowDirectionUnknown animated:YES];
        }
        else
        {
            [controller presentViewController:activityViewController animated:YES completion:^{
            }];
        }
    }
    
}

static  LFShareManager*_sharedSingleton = nil;
+ (LFShareManager *)sharedInstance {
    
    if (self != [LFShareManager class]) {
        
        [NSException raise:@"LKSystemSettings"
                    format:@"Cannot use sharedInstance method from subclass."];
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedSingleton = [[LFShareManager alloc] initInstance];
        });
    
    return _sharedSingleton;
}

- (instancetype)init {
    
    [NSException raise:@"LKSystemSettings"
                format:@"Cannot instantiate LKSystemSettings using init method, sharedInstance must be used."];
    
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    
    [NSException raise:@"LKSystemSettings"
                format:@"Cannot copy LKSystemSettings using copy method, sharedInstance must be used."];
    
    return nil;
}
#pragma mark - private method

- (id)initInstance {
    
    return [super init];
}
@end
