//
//  DOClient.h
//  DOWrapper
//
//  Created by Wahyu Sumartha  on 4/28/14.
//  Copyright (c) 2014 Wahyu Sumartha . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOSingleton.h"

@interface DOClient : NSObject

@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *apiKey;

do_declare_singleton(DOClient);

+ (DOClient *)startWithClientId:(NSString *)clientId apiKey:(NSString *)apiKey;

@end
