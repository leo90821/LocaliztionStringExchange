//
//  BLL.m
//  LocaliztionStringExchange
//
//  Created by 倪瑶 on 15/10/9.
//  Copyright © 2015年 nycode. All rights reserved.
//

#import "BLL.h"

@implementation BLL
static NSBundle *bundle = nil;

- (instancetype)init {
    self = [super init];
    return self;
}

+ (instancetype)currentLogic {
    static BLL *logic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logic = [[BLL alloc] init];
    });
    return logic;
}

+ (NSBundle *)bundle {
    return bundle;
}

/**
 * 初始化语言
 **/
- (void)initUserLanguage {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *string = [userDefault valueForKey:USER_DEFAULT_STRING];
    if (string.length == 0) {
        NSArray *languages = [userDefault objectForKey:APPLE_LANGUAGES];
        NSString *current = [languages objectAtIndex:0];
        string = current;
        [userDefault setValue:string forKey:USER_DEFAULT_STRING];
        [userDefault synchronize];
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}
/**
 * 获得当前语言
 **/
- (NSString *)getCurrentLanguage {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *language = [userDefault valueForKey:USER_DEFAULT_STRING];
    return language;
}
/**
 * 设置语言
 **/
- (void)setUserLanguageWithLanguage:(NSString *)language {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
    [userDefault setValue:language forKey:USER_DEFAULT_STRING];
    [userDefault synchronize];
}

@end
