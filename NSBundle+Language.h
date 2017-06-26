//
//  NSBundle+Language.h
//  Language
//
//  Created by Lcccocoa on 2017/6/23.
//  Copyright © 2017年 Lcccocoa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LanguageDefault,
    LanguageCN,
    LanguageEN,
} Language;

@interface NSBundle (Language)

/**
 Setting Language
 */
+ (void)setLanguage:(Language)language;

/**
 Clean Setting Language
 */
+ (void)clean;

@end
