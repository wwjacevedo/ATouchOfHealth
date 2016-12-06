//
//  QuestionsViewController.m
//  A Touch of Health
//
//  Created by Benjamin on 12/5/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import "QuestionsViewController.h"
#import "CustomViewCell.h"
#import "QuestionsModel.h"

@interface QuestionsViewController ()

@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _model = [[QuestionsModel alloc] init];
    [_model initQuestionsAndAnswers];
    _table_view.delegate = self;
    _table_view.dataSource = self;
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:  (NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:   (NSInteger)section
{
    switch (section) {
        case 1:
            return @"Exercise & Nutrition";
            break;
        case 2:
            return @"Meds for Health";
            break;
        case 3:
            return @"Mind and Body";
            break;
        case 4:
            return @"More on My Health";
            break;
        default:
            return @"";
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:  (NSIndexPath *)indexPath
{
    CustomViewCell *table_view_cell = [tableView dequeueReusableCellWithIdentifier:@"table_view_cell" forIndexPath:indexPath];
    
    if (indexPath.row < 5) {
        [table_view_cell.question setText:[_model.exerciseQuestions objectAtIndex:indexPath.row]];
        
        if ([_model.exerciseAnswers objectAtIndex:indexPath.row]) {
            [table_view_cell.yesButton setEnabled:@YES];
            [table_view_cell.noButton setEnabled:@NO];
        } else {
            [table_view_cell.yesButton setEnabled:@NO];
            [table_view_cell.noButton setEnabled:@YES];
        }
        
    } else if (indexPath.row > 4 && indexPath.row < 10) {
        [table_view_cell.question setText:[_model.medsQuestions objectAtIndex:indexPath.row - 5]];
        
        if ([_model.medsAnswers objectAtIndex:indexPath.row - 5]) {
            [table_view_cell.yesButton setEnabled:@YES];
            [table_view_cell.noButton setEnabled:@NO];
        } else {
            [table_view_cell.yesButton setEnabled:@NO];
            [table_view_cell.noButton setEnabled:@YES];
        }
        
    } else if (indexPath.row > 9 && indexPath.row < 15) {
        [table_view_cell.question setText:[_model.mindBodyQuestions objectAtIndex:indexPath.row - 10]];
        
        if ([_model.mindBodyAnswers objectAtIndex:indexPath.row - 10]) {
            [table_view_cell.yesButton setEnabled:@YES];
            [table_view_cell.noButton setEnabled:@NO];
        } else {
            [table_view_cell.yesButton setEnabled:@NO];
            [table_view_cell.noButton setEnabled:@YES];
        }
        
    } else {
        [table_view_cell.question setText:[_model.moreQuestions objectAtIndex:indexPath.row - 15]];
        
        if ([_model.moreAnswers objectAtIndex:indexPath.row - 15]) {
            [table_view_cell.yesButton setEnabled:@YES];
            [table_view_cell.noButton setEnabled:@NO];
        } else {
            [table_view_cell.yesButton setEnabled:@NO];
            [table_view_cell.noButton setEnabled:@YES];
        }
    }
    
    if ([table_view_cell.noButton isEnabled]) {
        [table_view_cell.noButton setBackgroundColor:([table_view_cell.yesButton backgroundColor])];
        [table_view_cell.noButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected & UIControlStateNormal];
        
        [table_view_cell.yesButton setBackgroundColor:[UIColor whiteColor]];
        [table_view_cell.yesButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected & UIControlStateNormal];
        
    } else {
        [table_view_cell.yesButton setBackgroundColor:([table_view_cell.noButton backgroundColor])];
        [table_view_cell.yesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected & UIControlStateNormal];
        
        [table_view_cell.noButton setBackgroundColor:[UIColor whiteColor]];
        [table_view_cell.noButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected & UIControlStateNormal];
    }
    
    return table_view_cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
