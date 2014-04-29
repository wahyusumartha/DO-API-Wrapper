//
//  DOSingleton.h
//  DOWrapper
//
//  Created by Wahyu Sumartha  on 4/28/14.
//  Copyright (c) 2014 Wahyu Sumartha . All rights reserved.
//

#ifndef DOWrapper_DOSingleton_h
#define DOWrapper_DOSingleton_h

#define kDOSingletonDefaultAccessor singleton

#define do_declare_singleton(classname) do_declare_singleton_with_accessor(classname, kDOSingletonDefaultAccessor)
#define do_declare_singleton_with_accessor(classname, accessor)\
+ (classname *)accessor;

#define do_synthesize_singleton(classname) do_synthesize_singleton_with_accessor(classname, kDOSingletonDefaultAccessor)
#define do_synthesize_singleton_with_accessor(classname, accessor)\
+ (classname *)accessor\
{\
    static classname *sharedManager = nil;\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        sharedManager = [[classname alloc] init];\
    });\
    return sharedManager;\
}

#endif
