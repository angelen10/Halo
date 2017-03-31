//
//  CYContact.m
//  Halo
//
//  Created by angelen on 2017/3/31.
//  Copyright © 2017年 ANGELEN. All rights reserved.
//

#import "CYContact.h"

@implementation CYContact

- (NSString *)description {
    NSArray<NSString *> *keys = @[@"name", @"age"];
    
    // 这样打印出来的格式就不再是 <CYContact: 0x6180000273a0> 之类的，而是会将属性内容具体打印
    return [self dictionaryWithValuesForKeys:keys].description;
}

@end
