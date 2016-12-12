//
//  QuestionsModel.m
//  A Touch of Health
//
//  Created by Benjamin on 12/6/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import "QuestionsModel.h"

@implementation QuestionsModel


- (void) initQuestionsAndAnswers {
    self.allQuestions = @[@"Eating at least 3 times a day and drinking 8 glasses of water (80z)/day?",
                               @"Someone that eats fast food more than 3 times/week?",
                               @"Exercising at least 30 minutes 3 time/week?",
                               @"Following a prescribed diet plan?",
                               @"Able to get assistance when you need it?",
                               @"Taking 5 ore more prescription meds (including pain meds) each day?",
                               @"Clear on how to and why you take your meds?",
                               @"Able to pay for your meds",
                               @"Foregetting to take any of your meds?",
                               @"Taking any supplements and/or vitamins on a regular basis?",
                               @"Drinking more than 2 alcoholic beverages/day?",
                               @"A spiritual person",
                               @"Feeling unsatisfied with your social life and/or feeling sad or blue 3 more times/week?",
                               @"Do you and/or your family/friends have conserns about your memory?",
                               @"Have you fallen more than 1 time in the last month?",
                               @"Satisfied with your current health plan?",
                               @"Do you have leisure time to relax?",
                               @"Able to change habits that you do not like?",
                               @"A positive person?",
                               @"Able to reflect on your greatest accomplishment?"];
    
//    self.medsQuestions = @[@"Taking 5 ore more prescription meds (including pain meds) each day?",
//                           @"Clear on how to and why you take your meds?",
//                           @"Able to pay for your meds",
//                           @"Foregetting to take any of your meds?",
//                           @"Taking any supplements and/or vitamins on a regular basis?"];
//    
//    self.mindBodyQuestions = @[@"Drinking more than 2 alcoholic beverages/day?",
//                               @"A spiritual person",
//                               @"Feeling unsatisfied with your social life and/or feeling sad or blue 3 more times/week?",
//                               @"Do you and/or your family/friends have conserns about your memory?",
//                               @"Have you fallen more than 1 time in the last month?"];
//    
//    self.moreQuestions = @[@"Satisfied with your current health plan?",
//                           @"Do you have leisure time to relax?",
//                           @"Able to change habits that you do not like?",
//                           @"A positive person?",
//                           @"Able to reflect on your greatest accomplishment?"];
    
    self.initAnswers;
    
}

- (void) initAnswers {
    self.answers = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < 20; index++) {
        [self.answers addObject:@"0"];
    }
}

@end
