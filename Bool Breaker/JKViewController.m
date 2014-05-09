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
@property (nonatomic, strong) NSMutableArray* results;
@end

@implementation JKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kResultsCellReuseIdentifier];

    //lets test some truths
    JKTruthFinder *truthFinder = [[JKTruthFinder alloc] init];
    self.results = [truthFinder runTests];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kResultsCellReuseIdentifier];
    NSDictionary *result = self.results[indexPath.row];
    NSString *description = [NSString stringWithFormat:@"%@: isTrue: %@ isYES: %@", result[kDescriptionKey], result[kIsTrueKey], result[kIsYesKey]];
    
    if([result[kTruthFailKey] boolValue]){
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor greenColor];
    }
    
    cell.textLabel.text = description;
    
    return cell;
}

@end
