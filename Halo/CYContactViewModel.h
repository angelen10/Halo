//
//  CYContactViewModel.h
//  Halo
//
//  Created by angelen on 2017/3/31.
//  Copyright © 2017年 ANGELEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@class CYContact;

@interface CYContactViewModel : NSObject

@property (strong, nonatomic) NSMutableArray<CYContact *> *contacts;

- (RACSignal *)loadContacts;

@end
