//
//  DOInstanceTest.mm
//  DOWrapper
//
//  Created by Wahyu Sumartha  on 4/28/14.
//  Copyright (c) 2014 Wahyu Sumartha . All rights reserved.
//

#import "DOClient.h"

SPEC_BEGIN(DOInstanceTests)

using namespace Cedar::Matchers;

describe(@"DOInstance", ^{
    __block DOClient *client;
    
    beforeEach(^{
        client = [DOClient singleton];
    });
    
    it(@"DOClient should not be nil", ^{
        client should_not be_nil;
    });
   
    context(@"when the object initialize with clientId and APIKey", ^{
        
        beforeEach(^{
            client = [DOClient startWithClientId:@"c8b7f61fafa01d1215f7cb82ac6b10a2" apiKey:@"4c3467743922444409ef34e4fadfcc45"];
        });
        
        it(@"clientId should match", ^{
            client.clientId should equal(@"c8b7f61fafa01d1215f7cb82ac6b10a2");
        });
        
        it(@"apiKey should match", ^{
            client.apiKey should equal(@"4c3467743922444409ef34e4fadfcc45");
        });
        
    });
});


SPEC_END