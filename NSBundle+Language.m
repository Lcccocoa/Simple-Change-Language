//
//  NSBundle+Language.m
//  Language
//
//  Created by Lcccocoa on 2017/6/23.
//  Copyright © 2017年 Lcccocoa. All rights reserved.
//

#import "NSBundle+Language.h"
#import <objc/runtime.h>

#define kBundleLanguageKey @"kBundleLanguageKey"

NSString * stringWithLanguage(Language language) {
    NSString *string = nil;
    switch (language) {
        case LanguageEN: string = @"en";
            break;
        default: string = @"zh-Hans";
            break;
    }
    return string;
}

static const char _bundle = 0;

@implementation NSBundle (Language)

+ (void)load
{
    Class cls = [NSBundle class];
    SEL originalSel = @selector(localizedStringForKey:value:table:);
    SEL newSel = @selector(sla_localizedStringForKey:value:table:);
    
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    Method newMethod = class_getInstanceMethod(cls, newSel);
    method_exchangeImplementations(originalMethod, newMethod);
    
    NSString *languageStr = [[NSUserDefaults standardUserDefaults] objectForKey:kBundleLanguageKey];
    if (languageStr) {
        NSBundle *newBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:languageStr ofType:@"lproj"]];
        objc_setAssociatedObject([NSBundle mainBundle],
                                 &_bundle,
                                 languageStr ? newBundle : nil,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC
                                 );
    }
}


+ (void)setLanguage:(Language)language
{
    NSString *languageStr = stringWithLanguage(language);
    NSBundle *newBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:languageStr ofType:@"lproj"]];
    objc_setAssociatedObject([NSBundle mainBundle],
                             &_bundle,
                             languageStr ? newBundle : nil,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC
                             );
    
    [[NSUserDefaults standardUserDefaults] setObject:languageStr forKey:kBundleLanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)clean
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kBundleLanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSString *)sla_localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle *bundle = objc_getAssociatedObject([NSBundle mainBundle], &_bundle);
    if (bundle) {
        return [bundle sla_localizedStringForKey:key value:value table:tableName];
    } else {
        return [[NSBundle mainBundle] sla_localizedStringForKey:key value:value table:tableName];
    }
}

@end
