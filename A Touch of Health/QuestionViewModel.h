//
//  QuestionViewModel.h
//  A Touch of Health
//
//  Created by Benjamin on 12/8/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "QuestionsModel.h"

@interface QuestionViewModel : NSObject

@property (strong, nonatomic) QuestionsModel* quesqtionCellmodel;

IBOutlet UIBarButtonItem *header_icon_button;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *back_button;
@property (weak, nonatomic) IBOutlet UILabel *label_msg;
@property (weak, nonatomic) IBOutlet UIImageView *label_image;
@property (weak, nonatomic) IBOutlet UITableView *table_view;
@property (weak, nonatomic) IBOutlet UIButton *save_button;
@property (weak, nonatomic) IBOutlet UIButton *clear_button;
@property (weak, nonatomic) IBOutlet UIButton *my_scores_button;
@property (weak, nonatomic) IBOutlet UIButton *privacy_policy_button;

@property Boolean moreQuestions;
@property NSInteger numOfQuestions;

- (void) yesButtonTapped:(UIButton *) sender;

@end
