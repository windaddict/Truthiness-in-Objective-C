//
//  JKTruthFinder.m
//  Bool Breaker
//
//  Created by John M. P. Knox on 5/8/14.
//  Copyright (c) 2014 John M. P. Knox. All rights reserved.
//

#import "JKTruthFinder.h"

@implementation JKTruthFinder

-(NSMutableArray*) runTests{
    self.results = [NSMutableArray new];
    
    [self runTest:NO description:@"NO"];
    
    [self runTest:YES description:@"YES"];
    
    [self runTest:0x00 description:@"0x00"];

    [self runTest:0x01 description:@"0x01"];

    [self runTest:0x02 description:@"0x02"];
    
    [self runTest:0x80 description:@"0x80"];

    [self runTest:0x01 | 0x02 description:@"0x01 | 0x02"];
    
    [self runTest:0xff & 0x02 description:@"0xff & 0x02"];
    
    [self runTest:0x01 << 1 description:@"0x01 << 1"];
    
    [self runTest:0x02 description:@"0x02"];
    
    [self runTest:3 == 4 description:@"3 == 4"];
    
    [self runTest:-1 description:@"-1"];
    
    [self runTest:1 description:@"1"];
    
    [self runTest:2 description:@"2"];
    
    [self runTest:(BOOL)self description:@"(BOOL)self"];
    
    [self runTest:(BOOL)0x8000 description:@"(BOOL)0x8000"];
    
    [self runTest:(bool)0x8000 description:@"(bool)0x8000"];
    
    [self runTest:(BOOL)(2) description:@"(BOOL)(2)"];
    
    [self runTest:(bool)(2) description:@"(bool)(2)"];
    
    [self runTest:((bool) 2) == ((bool) 4) description:@"((bool) 2) == ((bool) 4)"];
    
    [self runTest:2 == 3 description:@"2 == 3"];
    
    [self runTest:true == YES description:@"true == yes"];
    
    [self runTest:YES == TRUE description:@"YES == TRUE"];
    
    [self runTest:TRUE == 2 description:@"TRUE == 2"];
    
    [self runTest:!!0x80 description:@"!!0x80"];
    
    [self runTest:!!0x8000 description:@"!!0x8000"];
    
    [self runTest:NO != 0x8000 description:@"NO != 0x8000"];

    [self runTest:NO != (BOOL)0x8000 description:@"NO != (BOOL)0x8000"];

    [self runTest:NO != 0x80 description:@"NO != 0x80"];

    return self.results;
}


-(NSMutableDictionary*) runTest:(BOOL) value description:(NSString *) description{
    NSMutableDictionary *result = [self tryBOOL:value];
    result[kDescriptionKey] = description;
    [self.results addObject:result];
    return result;
}

-(NSMutableDictionary*)tryBOOL: (BOOL) value{
    NSMutableDictionary *results = [NSMutableDictionary new];
    
    BOOL isTrue = [[self class] isTrue: value];
    BOOL isYes = [[self class] isYes: value];
    BOOL truthFail = (((bool) isTrue) != ((bool) isYes));
    
    results[kIsTrueKey] = @(isTrue);
    results[kIsYesKey] = @(isYes);
    results[kTruthFailKey] = @(truthFail);
    
    return results;
}

+(BOOL)isTrue:(BOOL) value{
    if (value) {
        return YES;
    } else {
        return NO;
    }
}

+(BOOL)isYes:(BOOL) value{
    if(YES == value){
        return YES;
    } else {
        return NO;
    }
}

+(BOOL)isNO:(BOOL) value{
    if(NO == value){
        return YES;
    } else {
        return NO;
    }
}

@end
