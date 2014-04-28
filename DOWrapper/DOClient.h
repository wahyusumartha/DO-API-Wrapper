//
//  DOClient.h
//  DOWrapper
//
//  Created by Wahyu Sumartha  on 4/28/14.
//  Copyright (c) 2014 Wahyu Sumartha . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DOSingleton.h"

@class AFHTTPRequestOperationManager;
@class AFHTTPRequestOperation;

@interface DOClient : NSObject

@property (nonatomic, copy) NSString *clientId;
@property (nonatomic, copy) NSString *apiKey;

@property (nonatomic, strong) AFHTTPRequestOperationManager *operationManager; 

do_declare_singleton(DOClient);

/**
 *  This is the recomended way to init Digital Ocean Request in your application
 *  call this function in application:didFinishLaunchingWithOptions:
 *  @param clientId client identifier that you get from digital ocean 
 *  @param apiKey api key that you get from digital ocean 
 *  @return DOClient an object of DOClient Class 
 */
+ (DOClient *)startWithClientId:(NSString *)clientId apiKey:(NSString *)apiKey;

- (void)getRequest:(NSString *)url
            params:(NSDictionary *)dictionary
           success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
           failure:(void (^)(NSError *error)) failure;

@end
