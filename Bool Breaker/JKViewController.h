//
//  JKViewController.h
//  Bool Breaker
//
//  Created by John M. P. Knox on 5/8/14.
//  Copyright (c) 2014 John M. P. Knox. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kResultsCellReuseIdentifier = @"results";

@interface JKViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
