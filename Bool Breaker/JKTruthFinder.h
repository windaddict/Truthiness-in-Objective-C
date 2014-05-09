//
//  JKTruthFinder.h
//  Bool Breaker
//
//  Created by John M. P. Knox on 5/8/14.
//  Copyright (c) 2014 John M. P. Knox. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kIsTrueKey = @"isTrue";
static NSString *const kIsYesKey = @"isYes";
static NSString *const kTruthFailKey = @"truthFail";
static NSString *const kDescriptionKey = @"description";

@interface JKTruthFinder : NSObject
@property NSMutableArray* results;
-(NSMutableArray*) runTests;
@end
