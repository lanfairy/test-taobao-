//
//  ViewController.m
//  test
//
//  Created by 张俊伟 on 2016/12/9.
//  Copyright © 2016年 lanfairy. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+LF.h"
#import <AlibcTradeSDK/AlibcTradeSDK.h>
#import "LFShareManager.h"

//#define  kHOMEURL  @"http://www.xiaofupo123.com"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *BottomView;
@property (weak, nonatomic) IBOutlet UIView *LineView;
@property (weak, nonatomic) IBOutlet UIButton *goBack;
@property (weak, nonatomic) IBOutlet UIButton *homeBtn;
@property (weak, nonatomic) IBOutlet UIButton *customersBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (copy, nonatomic) NSString *shareUrl;

@end

@implementation ViewController
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"小富婆";
    
    self.BottomView.backgroundColor = [UIColor colorWithRed:0.94f green:0.02f blue:0.51f alpha:0.8f];
    self.LineView.backgroundColor = [UIColor colorWithRed:0.98f green:0.98f blue:0.98f alpha:0.5f];
    // Do any additional setup after loading the view, typically from a nib.
    //http://www.hym123.cn/
    //http://www.xiaofupo123.com
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kHOMEURL]]];
    self.webView.scrollView.bounces = NO;
    self.webView.scrollView.showsVerticalScrollIndicator = NO;
    

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goBackAction:(UIButton *)sender {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}
- (IBAction)homeAction:(UIButton *)sender {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.xiaofupo123.com"]]];
}
- (IBAction)customerAction:(UIButton *)sender {
    
    NSMutableString *string = [NSMutableString stringWithString:@"领取下单红包联系客服"];
    [string appendFormat:@"\n%@",@"客服微信号:929763957"];
    [MBProgressHUD show:string view:self.view];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUD];
//    });
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [MBProgressHUD hideHUDForView:self.view];
}
- (IBAction)shareAction:(UIButton *)sender {
    [[LFShareManager sharedInstance] shareSourceView:self.shareBtn PresentViewController:self Url:self.shareUrl];
    
//    [[LFShareManager sharedInstance] shareWithImage:nil APPUrl:self.shareUrl AndFrame:CGRectZero PresentToController:self];

    
}


//request.URL:http://www.xiaofupo123.com/?r=item/160241
//2016-12-23 21:15:20.240 test[1019:25778] scheme:http
//2016-12-23 21:15:20.241 test[1019:25778] host:www.xiaofupo123.com
//2016-12-23 21:15:20.242 test[1019:25778] path:/
//2016-12-23 21:15:20.247 test[1019:25778] query:r=item/160241
//2016-12-23 21:15:20.247 test[1019:25778] HTTPBody:(null)
//2016-12-23 21:15:20.248 test[1019:25778] allHTTPHeaderFields:{
//    Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
//    Referer = "http://www.xiaofupo123.com/";
//    "User-Agent" = "Mozilla/5.0 (iPhone; CPU iPhone OS 10_0 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Mobile/14A345";
//}


//taobao://uland.taobao.com/coupon/edetail?activityId=711055a819ce415ea93aee0f82bd2d7f&pid=mm_110829117_16310544_60992840&itemId=543206760271&src=shz_shz&point=%7B%22from%22%3A%22h5%22%2C%22pid%22%3A%22mm_110829117_16310544_60992840%22%2C%22h5_uid%22%3A%220255561579534223653312076560696141%22%2C%22url%22%3A%22http%3A%2F%2Fuland.taobao.com%2Fcoupon%2Fedetail%22%7D


//request.URL:http://uland.taobao.com/coupon/edetail?activityId=1e825974c56c4ea7aeb1adcac2dfa79b&pid=mm_110829117_16310544_60992840&itemId=540938212648&src=shz_shz
//2016-12-23 22:15:10.357 test[1019:25778] scheme:http
//2016-12-23 22:15:10.357 test[1019:25778] host:uland.taobao.com
//2016-12-23 22:15:10.359 test[1019:25778] path:/coupon/edetail
//2016-12-23 22:15:10.361 test[1019:25778] query:activityId=1e825974c56c4ea7aeb1adcac2dfa79b&pid=mm_110829117_16310544_60992840&itemId=540938212648&src=shz_shz
//2016-12-23 22:15:10.361 test[1019:25778] HTTPBody:(null)
//2016-12-23 22:15:10.362 test[1019:25778] allHTTPHeaderFields:{
//    Accept = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
//    Referer = "http://www.xiaofupo123.com/?r=item/160241";
//    "User-Agent" = "Mozilla/5.0 (iPhone; CPU iPhone OS 10_0 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Mobile/14A345";
//}



//http://uland.taobao.com/coupon/edetail?activityId=a7488e25b005401f83af5a03ade9349e&pid=mm_110829117_16310544_60992840&itemId=534214192450&src=shz_shz

//taobao://uland.taobao.com/coupon/edetail?activityId=a7488e25b005401f83af5a03ade9349e&pid=mm_110829117_16310544_60992840&itemId=534214192450&src=shz_shz&point=%7B%22from%22%3A%22h5%22%2C%22pid%22%3A%22mm_110829117_16310544_60992840%22%2C%22h5_uid%22%3A%22EM%2FkEEFF%2FS8CAXbGSmCvp%2F7X%22%2C%22url%22%3A%22http%3A%2F%2Fuland.taobao.com%2Fcoupon%2Fedetail%22%7D
#pragma mark - webViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if ([request.URL.scheme isEqualToString:@"http"]) {
        
        self.shareUrl = request.URL.absoluteString;
    }
    NSLog(@"request.URL:%@",request.URL);
    NSLog(@"scheme:%@",request.URL.scheme);
    NSLog(@"host:%@",request.URL.host);
    NSLog(@"path:%@",request.URL.path);
    NSLog(@"query:%@",request.URL.query);
    NSLog(@"HTTPBody:%@",request.HTTPBody);
    NSLog(@"allHTTPHeaderFields:%@",request.allHTTPHeaderFields);//Referer
    
    if ([request.URL.host isEqualToString:@"uland.taobao.com"]) {
        //打开商品详情页
//        id<ALiTradePage> page = [ALiTradePageFactory itemDetailPage: @”123456”];
        
        //添加商品到购物车
//        id<ALiTradePage> page = [ALiTradePageFactory addCartPage: @"123456"];
        
        //根据链接打开页面
        
        //打开店铺
//        id<ALiTradePage> page = [ALiTradePageFactory shopPage: @”12333333”];
        
        //打开我的订单页
//        id<ALiTradePage> page = [ALiTradePageFactory myOrdersPage:0 isAllOrder:YES];
        
        //打开我的购物车
//        id<ALiTradePage> page = [ALiTradePageFactory myCartsPage];
        
        id<AlibcTradePage> page = [AlibcTradePageFactory page: request.URL.absoluteString];
        
        //淘客信息
        AlibcTradeTaokeParams *taoKeParams=[[AlibcTradeTaokeParams alloc] init];
        taoKeParams.pid=@"mm_110829117_16310544_60992840"; //
        //打开方式
        AlibcTradeShowParams* showParam = [[AlibcTradeShowParams alloc] init];
        showParam.openType = ALiOpenTypeAuto;
        
        [[AlibcTradeSDK sharedInstance].tradeService show:self page:page showParams:showParam taoKeParams:taoKeParams trackParam:[self trackParams] tradeProcessSuccessCallback:^(AlibcTradeResult * _Nullable result) {
            NSLog(@"result : %@",result);
        } tradeProcessFailedCallback:^(NSError * _Nullable error) {
            NSLog(@"error : %@",error.description);
        }];

        return NO;
    }
    
    
    
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    static BOOL isFirst = YES;
    if (isFirst) {
        [MBProgressHUD showMessage:@"拼命加载中..." toView:_webView];
        isFirst = NO;
    }
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [MBProgressHUD hideHUDForView:_webView];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
//    [MBProgressHUD showError:@"加载失败!"];
}


- (NSDictionary *)trackParams {
    return @{@"track_key": @"track_value"};
}

@end
