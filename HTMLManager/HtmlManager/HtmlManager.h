//
//  HtmlManager.h
//  Avery
//
//  Created by Avery on 2018/11/8.
//  Copyright © 2018年 Avery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

typedef void (^DownloadCompletion) (UIImage * _Nullable _image);

NS_ASSUME_NONNULL_BEGIN

@interface HtmlManager : NSObject

- (NSString *)processImagesInHtml:(NSString *)html_
                          webView:(WKWebView *)webView;

- (NSString *)appendLocalCssStytle:(NSString *)html_;

- (NSString *)appendRemoteCssStytle:(NSString *)html_
                                css:(NSString *)cssUrlString;

@end

NS_ASSUME_NONNULL_END
