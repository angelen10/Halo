//
//  CYContactViewModel.m
//  Halo
//
//  Created by angelen on 2017/3/31.
//  Copyright © 2017年 ANGELEN. All rights reserved.
//

#import "CYContactViewModel.h"
#import "CYContact.h"

@implementation CYContactViewModel

- (RACSignal *)loadContacts {
    self.contacts = [NSMutableArray array];

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [NSThread sleepForTimeInterval:1.0];
            
            for (int i = 0; i < 20; i++) {
                CYContact *contact = [[CYContact alloc] init];
                contact.name = [NSString stringWithFormat:@"Chileung - %d", i];
                contact.age = 15 + arc4random_uniform(20);
                [self.contacts addObject:contact];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                BOOL hasError = NO;
                if (hasError) {
                    [subscriber sendError:[NSError errorWithDomain:@"me.angelen.error" code:10001 userInfo:@{@"message": @"随便搞出来的错误，唔好在意"}]];
                } else {
                    [subscriber sendNext:self]; // 将 CYContactViewModel 传回给订阅者
                }
                
                [subscriber sendCompleted];
            });
            
        });
        return nil; // 返回值先不管
    }];
}

@end
