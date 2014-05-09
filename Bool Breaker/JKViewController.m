//
//  JKViewController.m
//  Bool Breaker
//
//  Created by John M. P. Knox on 5/8/14.
//  Copyright (c) 2014 John M. P. Knox. All rights reserved.
//

#import "JKViewController.h"
#import "JKTruthFinder.h"

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    JKTruthFinder *truthFinder = [[JKTruthFinder alloc] init];
    [truthFinder runTests];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
