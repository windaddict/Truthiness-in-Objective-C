//
//  JKTruthFinder.m
//  Bool Breaker
//
//  Created by John M. P. Knox on 5/8/14.
//  Copyright (c) 2014 John M. P. Knox. All rights reserved.
//

#import "JKTruthFinder.h"

@implementation JKTruthFinder

-(void) runTests{
    [self logTest:NO description:@"NO"];
    
    [self logTest:YES description:@"YES"];
    
    [self logTest:0x00 description:@"0x00"];

    [self logTest:0x01 description:@"0x01"];

    [self logTest:0x02 description:@"0x02"];
    
    [self logTest:0x80 description:@"0x80"];

    [self logTest:0x01 | 0x02 description:@"0x01 | 0x02"];
    
    [self logTest:0xff & 0x02 description:@"0xff & 0x02"];
    
    [self logTest:0x01 << 1 description:@"0x01 << 1"];
    
    [self logTest:0x02 description:@"0x02"];
    
    [self logTest:3 == 4 description:@"3 == 4"];
    
    [self logTest:-1 description:@"-1"];
    
    [self logTest:1 description:@"1"];
    
    [self logTest:2 description:@"2"];
    
    [self logTest:(BOOL)self description:@"(BOOL)self"];
    
    [self logTest:(BOOL)0x8000 description:@"(BOOL)0x8000"];
    
    [self logTest:(bool)0x8000 description:@"(bool)0x8000"];
    
    [self logTest:(BOOL)(2) description:@"(BOOL)(2)"];
    
    [self logTest:(bool)(2) description:@"(bool)(2)"];
    
    [self logTest:((bool) 2) == ((bool) 4) description:@"((bool) 2) == ((bool) 4)"];
    
    [self logTest:2 == 3 description:@"2 == 3"];
    
    [self logTest:true == YES description:@"true == yes"];
    
    [self logTest:YES == TRUE description:@"YES == TRUE"];
    
    [self logTest:TRUE == 2 description:@"TRUE == 2"];
    
}

-(void)logTest:(BOOL) value description:(NSString *) description{
    NSString *result = [self test:value description:description];
    NSLog(@"Test %@", result);
}

-(NSMutableString *)test:(BOOL) value description:(NSString *) description{
    NSMutableString * testResult = [description mutableCopy];
    [testResult appendString:@": "];
    [testResult appendString: [self interrogateBOOL:value]];
    return testResult;
}

-(NSString*) interrogateBOOL: (BOOL) value{
    NSMutableString *description = [NSMutableString new];
    BOOL isTrue = [[self class] isTrue: value];
    BOOL isYes = [[self class] isYes: value];
    
    if(isTrue){
        [description appendString:@"true, "];
    } else {
        [description appendString:@"false, "];
    }
    
    if(isYes){
        [description appendString:@"YES "];
    } else {
        [description appendString:@" NOTYES "];
    }
    
    if (((bool) isTrue) != ((bool) isYes) ) {
        [description appendString:@"-TRUTH-FAIL------- "];
    }
    
    return description;
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
