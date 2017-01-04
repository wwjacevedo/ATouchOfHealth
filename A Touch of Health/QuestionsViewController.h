//
//  QuestionsViewController.h
//  A Touch of Health
//
//  Created by Benjamin on 12/5/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QuestionsModel.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface QuestionsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate>

- (IBAction)backButtonAction:(id)sender;

@property (weak, nonatomic) NSUserDefaults *userDefaults;
@property (strong, nonatomic) QuestionsModel* model;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *header_icon_button;
@property (strong, nonatomic) IBOutlet UIButton *back_button;

@property (weak, nonatomic) IBOutlet UILabel *label_msg;
@property (weak, nonatomic) IBOutlet UIImageView *label_image;

@property (weak, nonatomic) IBOutlet UITableView *table_view;

@property (weak, nonatomic) IBOutlet UIButton *contact_us_button;
@property (weak, nonatomic) IBOutlet UIButton *save_button;
@property (weak, nonatomic) IBOutlet UIButton *clear_button;
@property (weak, nonatomic) IBOutlet UIButton *my_scores_button;
@property (weak, nonatomic) IBOutlet UIButton *privacy_policy_button;

@property (weak, nonatomic) IBOutlet UIView *main_buttons;
@property (weak, nonatomic) IBOutlet UIView *results_button_view;

@property (weak, nonatomic) IBOutlet UIButton *my_result;
@property (weak, nonatomic) IBOutlet UIButton *more_questions_button;
@property (weak, nonatomic) IBOutlet UIButton *no_thanks_button;
@property (weak, nonatomic) IBOutlet UIView *more_buttons_view_first;


- (void) activateMoreQuestions;
- (void) saveToResults;

@property Boolean moreQuestions;
@property NSInteger numOfQuestions;

- (void) manageHeaderImageAndMsgRespectTo:(NSIndexPath *) indexPath;

- (void) yesButtonTapped:(UIButton *) sender;
- (void) noButtonTapped:(UIButton *) sender;

- (void) readAnswersSaved;
- (BOOL) checkForAnswers;

- (void) sendEmail:(id) sender;
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error;
- (void) sendEmailTo:(NSString *)to withSubject:(NSString *)subject withBody:(NSString *)body;

@end
