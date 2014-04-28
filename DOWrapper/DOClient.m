//
//  DOClient.m
//  DOWrapper
//
//  Created by Wahyu Sumartha  on 4/28/14.
//  Copyright (c) 2014 Wahyu Sumartha . All rights reserved.
//

#import "DOClient.h"

@implementation DOClient

do_synthesize_singleton(DOClient);

+ (DOClient *)startWithClientId:(NSString *)clientId apiKey:(NSString *)apiKey
{
    DOClient *doInstance = [self singleton];
    
    if (doInstance) {
        doInstance.clientId  = clientId;
        doInstance.apiKey = apiKey;
    }
    
    return doInstance;
}

@end
