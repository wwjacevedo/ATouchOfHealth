//
//  ResultsViewController.h
//  A Touch of Health
//
//  Created by Benjamin on 12/13/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsModel.h"

@interface ResultsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *geriatric_care_button;
@property (weak, nonatomic) IBOutlet UIButton *life_planning_button;
@property (weak, nonatomic) IBOutlet UILabel *msg_one;
@property (weak, nonatomic) IBOutlet UILabel *msg_two;
@property (weak, nonatomic) IBOutlet UIButton *contact_us_button;

@property (strong, nonatomic) ResultsModel *model;
@property int results;

- (void) readAnswersSaved;
- (int) calculateResults;
- (void) displayMsgs;
- (void) sendEmail;
- (void) sendEmailTo:(NSString *)to withSubject:(NSString *)subject withBody:(NSString *)body;
- (void) goToGeriatricSite;
- (void) goToLifePlanningSite;

@end
