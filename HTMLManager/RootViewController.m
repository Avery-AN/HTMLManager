//
//  RootViewController.m
//  HTMLManager
//
//  Created by Avery An on 2019/11/28.
//  Copyright © 2019 Avery. All rights reserved.
//

#import "RootViewController.h"
#import <WebKit/WebKit.h>
#import "HtmlManager/HtmlManager.h"

#define UIHeight            [[UIScreen mainScreen] bounds].size.height
#define UIWidth             [[UIScreen mainScreen] bounds].size.width
#define NavigationBarHeight ([[UIScreen mainScreen] bounds].size.height - 812 >= 0 ? 88 : 64)

@interface RootViewController ()
@property (nonatomic) NSString *html;
@property (nonatomic) WKWebView *webView;
@property (nonatomic) HtmlManager *htmlManager;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createHtml];
    [self createWebView];
    [self.view addSubview:self.webView];
    [self processHtml];
}

- (void)createHtml {
    NSString *html = @"<html> \n"
    "<head> \n"
    "<style type=\"text/css\"> \n"
    "body {font-size:16px;} \n"
    "</style> \n"
    "</head> \n"
    "<body><script type='text/javascript'>window.onload = function(){ \n"
    "    var $img = document.getElementsByTagName('img'); \n"
    "    for(var p in  $img){ \n"
    "        $img[p].style.width = '100%'; \n"
    "        $img[p].style.height ='auto' \n"
    "    } \n"
    "}</script><!DOCTYPE html><html><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0,maximum-scale=1.0,user-scalable=NO\"/><link href=\"http://wwwbvb.bweibo.net/css/web_view.css?20181108123236\"></script></head><body><p>文章开始</p> \n"
    "<p>最近，“区块链”的热度居高不下，但一些地方出现“虚火过旺”，比如有人怀着暴富心态花式蹭热点，借区块链大肆炒作；有人直接宣扬“炒币获得官方支持”，热炒空气币等。区块链不是炒作的“噱头”、行骗的“招牌”，也绝不等于数字货币。\n人民日报发表评论称，区块链的出现虽与虚拟货币有着千丝万缕的关系，但区块链并不能与虚拟货币画等号，虚拟货币更不是区块链应用的全部。一些人故意混淆“币”“链”概念，与虚拟货币相关的炒作花样翻新、投机盛行，价格暴涨暴跌的背后风险快速聚集。即使是最具代表性的虚拟货币“比特币”，也不是哪国的法定流通货币，本质仍是一种投资风险极高的虚拟商品。看上去很美的风口，很可能又是陷阱罢了。\n任何创新都应以合法合规为前提。占据区块链技术制高点，亦没有捷径可走。目前，区块链技术应用已延伸到数字金融、物联网、智能制造等领域。</p> \n"
    "<p style=\"text-align:center;\"><img src=\"https://upload-images.jianshu.io/upload_images/17788728-c70af7cb2d08d901.jpg\" /></p> \n"
    "<p style=\"text-align:center;\"><img src=\"https://upload-images.jianshu.io/upload_images/14892748-590eb681e5adfa96\" /></p>  \n"
    "<p style=\"text-align:center;\"><img src=\"https:www.avery.com/123/abc.jpg!thumb\" /></p>  \n"
    "<p style=\"text-align:start;\">​靠区块链发横财不靠谱，不过这个行业还有很多机会，技术的发展存在非常大的想象空间。</p> \n"
    "<p style=\"text-align:start;\">任何创新都应以合法合规为前提。占据区块链技术制高点，亦没有捷径可走。</p> \n"
    "<p style=\"text-align:start;\"><img src=\"https://upload-images.jianshu.io/upload_images/8666040-e168249b5659f7b1.jpeg\" /></p> \n"
    "<p style=\"text-align:start;\">​目前，区块链技术应用已延伸到数字金融、物联网、智能制造等领域。</p> \n"
    "</body></html></body></html> \n";
    
    self.html = html;
}
- (void)createWebView {
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *controller = [[WKUserContentController alloc] init];
    configuration.userContentController = controller;
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, NavigationBarHeight, UIWidth, UIHeight-NavigationBarHeight) configuration:configuration];
}
- (void)processHtml {
    HtmlManager *htmlManager = [HtmlManager new];
    self.htmlManager = htmlManager;
    self.html = [htmlManager appendLocalCssStytle:self.html];
    self.html = [htmlManager processImagesInHtml:self.html webView:self.webView];
    [self.webView loadHTMLString:self.html baseURL:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
