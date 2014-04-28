//
//  CedarTest.mm
//  DOWrapper
//
//  Created by Wahyu Sumartha  on 4/28/14.
//  Copyright (c) 2014 Wahyu Sumartha . All rights reserved.
//

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(CedarTest)

describe(@"My name", ^{
    __block NSString *string;
    
    beforeEach(^{
        string = @"Mud";
    });
    
    it(@"should be Mud", ^{
        string should contain(@"Mud");
    });
});

SPEC_END
