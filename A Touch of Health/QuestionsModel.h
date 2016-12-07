//
//  QuestionsModel.h
//  A Touch of Health
//
//  Created by Benjamin on 12/6/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionsModel : NSObject

@property (strong, nonatomic) NSArray* exerciseQuestions;
@property (strong, nonatomic) NSArray* medsQuestions;
@property (strong, nonatomic) NSArray* mindBodyQuestions;
@property (strong, nonatomic) NSArray* moreQuestions;
@property (strong, nonatomic) NSMutableArray* exerciseAnswers;
@property (strong, nonatomic) NSMutableArray* medsAnswers;
@property (strong, nonatomic) NSMutableArray* mindBodyAnswers;
@property (strong, nonatomic) NSMutableArray* moreAnswers;

@property (strong, nonatomic) NSMutableArray* answers;

- (void) initQuestionsAndAnswers;
- (void) yesButtonTapped;

@end
