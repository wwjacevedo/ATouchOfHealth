//
//  ScoreViewController.h
//  A Touch of Health
//
//  Created by Benjamin on 12/12/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table_view;
@property (weak, nonatomic) IBOutlet UIButton *contact_us_button;

@property NSMutableArray *scores;

- (void) readSaveResults;

@end
