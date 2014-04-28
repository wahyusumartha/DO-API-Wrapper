//
//  DOClient.m
//  DOWrapper
//
//  Created by Wahyu Sumartha  on 4/28/14.
//  Copyright (c) 2014 Wahyu Sumartha . All rights reserved.
//

#import "DOClient.h"
#import "DOAPIUrl.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@implementation DOClient

@synthesize operationManager;

do_synthesize_singleton(DOClient);

- (id)init
{
    if (self = [super init]) {
        operationManager = [AFHTTPRequestOperationManager manager];
    }
    
    return self;
}

+ (DOClient *)startWithClientId:(NSString *)clientId apiKey:(NSString *)apiKey
{
    DOClient *doInstance = [self singleton];
    
    if (doInstance) {
        doInstance.clientId  = clientId;
        doInstance.apiKey = apiKey;
    }
    
    return doInstance;
}

- (NSString *)buildUrlParams:(NSDictionary *)dictionary
{
    NSMutableString *urlParams = [[NSMutableString alloc] initWithString:@"?"];
    for (NSString *key in dictionary.allKeys) {
        NSString *parameter = [dictionary objectForKey:key];
        
        if ([key isEqualToString:[dictionary.allKeys lastObject]]) {
            [urlParams appendString:[NSString stringWithFormat:@"%@=%@", key, parameter]];
        } else {
            [urlParams appendString:[NSString stringWithFormat:@"%@=%@&", key, parameter]];
        }
    }
    
    return urlParams;
}

- (void)getRequest:(NSString *)url params:(NSDictionary *)dictionary success:(void (^)(AFHTTPRequestOperation*, id))success failure:(void (^)(NSError *))failure
{
    NSString *requestUrl = [NSString stringWithFormat:@"%@/%@/%@", kDigitalOceanRootURL, url, [self buildUrlParams:dictionary]];
    
    [self.operationManager GET:requestUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation, responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
}

@end
