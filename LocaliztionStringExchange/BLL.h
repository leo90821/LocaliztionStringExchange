//
//  BLL.h
//  LocaliztionStringExchange
//
//  Created by 倪瑶 on 15/10/9.
//  Copyright © 2015年 nycode. All rights reserved.
//

#import <Foundation/Foundation.h>

#define USER_DEFAULT_STRING @"userLanguage"
#define APPLE_LANGUAGES @"AppleLanguages"
/**
 * App BLL
 **/
@interface BLL : NSObject
/**
 * BLL single
 **/
+ (instancetype)currentLogic;
/**
 * App bundle
 **/
+ (NSBundle *)bundle;
/**
 * 初始化语言
 **/
- (void)initUserLanguage;
/**
 * 获得当前语言
 **/
- (NSString *)getCurrentLanguage;
/**
 * 设置语言
 **/
- (void)setUserLanguageWithLanguage:(NSString *)language;
@end
