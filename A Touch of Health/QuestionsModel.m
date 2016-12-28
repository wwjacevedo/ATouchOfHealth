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
    self.allQuestions = @[@"1. Eating at least 3 times a day and drinking 8 glasses of water (8oz)/day?",
                               @"2. Someone that eats fast food more than 3 times/week?",
                               @"3. Exercising at least 30 minutes 3 time/week?",
                               @"4. Following a prescribed diet plan?",
                               @"5. Able to get assistance when you need it?",
                               @"6. Taking 5 or more prescription meds (including pain meds) each day?",
                               @"7. Clear on how to and why you take your meds?",
                               @"8. Able to pay for your meds?",
                               @"9. Forgetting to take any of your meds?",
                               @"10. Taking any supplements and/or vitamins on a regular basis?",
                               @"11. Drinking more than 2 alcoholic beverages/day?",
                               @"12. A spiritual person?",
                               @"13. Feeling unsatisfied with your social life and/or feeling sad or blue 3 more times/week?",
                               @"14. Do you and/or your family/friends have conserns about your memory?",
                               @"15. Have you fallen more than 1 time in the last month?",
                               @"16. Satisfied with your current health plan?",
                               @"17. Do you have leisure time to relax?",
                               @"18. Able to change habits that you do not like?",
                               @"19. A positive person?",
                               @"20. Able to reflect on your greatest accomplishment?"];
    
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
    
    [self initAnswers];
    
}

- (void) initAnswers {
    self.answers = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < 20; index++) {
        [self.answers addObject:@"0"];
    }
}

@end
