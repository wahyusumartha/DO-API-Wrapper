//
//  DOInstanceTest.mm
//  DOWrapper
//
//  Created by Wahyu Sumartha  on 4/28/14.
//  Copyright (c) 2014 Wahyu Sumartha . All rights reserved.
//

#import "DOClient.h"
#import "DOWrapperTestHelper.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

SPEC_BEGIN(DOInstanceTests)

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

describe(@"DOInstance", ^{
    __block DOClient *client;
    
    static NSString * clientId = @"c8b7f61fafa01d1215f7cb82ac6b10a81";
    static NSString * apiKey = @"cb93ceb6b0b6c1be901d834139d3cc832";
    
    beforeEach(^{
        client = [DOClient startWithClientId:clientId apiKey:apiKey];
    });
    
    it(@"DOClient should not be nil", ^{
        client should_not be_nil;
    });
   
    context(@"when the object initialize with clientId and APIKey", ^{
        
        it(@"clientId should match", ^{
            client.clientId should equal(clientId);
        });
        
        it(@"apiKey should match", ^{
            client.apiKey should equal(apiKey);
        });
        
    });
    
    context(@"when the object is request get method", ^{

        it(@"should return 200", ^{
            
            StartBlock();
            
            [client getRequest:@"droplets" params:[NSDictionary dictionaryWithObjectsAndKeys:clientId, @"client_id",
                                                  apiKey, @"api_key",nil] success:^(AFHTTPRequestOperation *operation, id responseObject) {
                EndBlock();
                [[operation response] statusCode] should equal(200);
                
            } failure:^(NSError *error) {
                EndBlock();
                fail(@"Request Failed - it should return 200");
            }];
            
            WaitUntilBlockCompletes();
            
        });
    });
    
});


SPEC_END