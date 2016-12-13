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
    _moreQuestions = false;
    _numOfQuestions = 15;
    
    if (self.checkForAnswers) {
        NSLog(@"ANSWERS : YES");
        [self readAnswersSaved];
    } else {
        NSLog(@"NO ANSWERS");
    }
    
//    _back_button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(back)];
    [self.save_button addTarget:self action:@selector(saveQuestionsState) forControlEvents:UIControlEventTouchUpInside];
    [self.clear_button addTarget:self action:@selector(clearAnswers) forControlEvents:UIControlEventTouchUpInside];
    [self.contact_us_button addTarget:self action:@selector(sendEmail:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) viewWillAppear:(BOOL)animated {
    
    if (_moreQuestions) {
        _numOfQuestions = 20;
    } else {
        _numOfQuestions = 15;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    return _numOfQuestions;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *) tableView {
    return 1;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat height = scrollView.frame.size.height;
    
    CGFloat contentYoffset = scrollView.contentOffset.y;
    
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
    
    if(distanceFromBottom < (height)) {
        NSLog(@"end of the table %f", height);
        
//        [self.main_buttons setHidden:YES];

        if (self.moreQuestions) {
            [self.more_buttons_view_first setHidden:YES];
            [self.results_button_view setHidden:NO];
        } else {
            [self.more_buttons_view_first setHidden:NO];
            [self.results_button_view setHidden:YES];
        }

    } else {
        
        [self.more_buttons_view_first setHidden:YES];
        [self.results_button_view setHidden:YES];
//        [self.main_buttons setHidden:NO];
    }
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath{
    
    [self manageHeaderImageAndMsgRespectTo:indexPath];
    
    CustomViewCell *table_view_cell = [tableView dequeueReusableCellWithIdentifier:@"table_view_cell" forIndexPath:indexPath];
    
    [table_view_cell.yesButton addTarget:self action:@selector(yesButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [table_view_cell.yesButton setShowsTouchWhenHighlighted:@YES];
    table_view_cell.yesButton.tag = indexPath.row;
    
    [table_view_cell.noButton addTarget:self action:@selector(noButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [table_view_cell.noButton setShowsTouchWhenHighlighted:@YES];
    table_view_cell.noButton.tag = indexPath.row;
    
    if (indexPath != nil) {
        [table_view_cell.question setText:[_model.allQuestions objectAtIndex:indexPath.row]];
        
        if ([[self.model.answers objectAtIndex:indexPath.row] isEqualToString:@"1"]) {
            [table_view_cell.yesButton setEnabled:@YES];
            [table_view_cell.noButton setEnabled:@NO];
        } else {
            [table_view_cell.yesButton setEnabled:@NO];
            [table_view_cell.noButton setEnabled:@YES];
        }
    }
    
    if ([[self.model.answers objectAtIndex:indexPath.row] isEqualToString:@"1"]) {
        [table_view_cell.yesButton setBackgroundColor:[UIColor colorWithRed:0.63 green:0.60 blue:0.87 alpha:1.0]];
        [table_view_cell.yesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected & UIControlStateNormal];
        
        [table_view_cell.noButton setBackgroundColor:[UIColor whiteColor]];
        [table_view_cell.noButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected & UIControlStateNormal];

    } else {
        [table_view_cell.noButton setBackgroundColor:[UIColor colorWithRed:0.63 green:0.60 blue:0.87 alpha:1.0]];
        [table_view_cell.noButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected & UIControlStateNormal];
        
        [table_view_cell.yesButton setBackgroundColor:[UIColor whiteColor]];
        [table_view_cell.yesButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected & UIControlStateNormal];
    }
    
    return table_view_cell;
}

- (void) yesButtonTapped:(UIButton *) button {
    
    NSInteger index = button.tag;

    if (button.isEnabled) {
        [self.model.answers replaceObjectAtIndex:index withObject:@"1"];
        [self.table_view reloadData];

    } else {
        [self.model.answers replaceObjectAtIndex:index withObject:@"0"];
        [self.table_view reloadData];
    }
}

- (void) noButtonTapped:(UIButton *) button {
    
    NSInteger index = button.tag;
    
    if (button.isEnabled) {
        [self.model.answers replaceObjectAtIndex:index withObject:@"0"];
        [self.table_view reloadData];
        
    } else {
        [self.model.answers replaceObjectAtIndex:index withObject:@"1"];
        [self.table_view reloadData];
    }
}

- (void) manageHeaderImageAndMsgRespectTo :(NSIndexPath *) indexPath {
    
    NSInteger index = (NSInteger) indexPath.row;
    
    
    self.label_image.contentMode = UIViewContentModeScaleAspectFit;
    
    if (index < 5) {
        [self.label_msg setText:@"Exercise & Nutritioin"];
        [self.label_image setImage:[UIImage imageNamed:@"exercise.png"]];
//        self.label_image.contentMode = UIViewContentModeScaleToFill;
        
    } else if (index > 4 && index < 10) {
        [self.label_msg setText:@"Meds for Health"];
        [self.label_image setImage:[UIImage imageNamed:@"meds_health.png"]];
        
    } else if (index > 10 && index < 15) {
        [self.label_msg setText:@"Mind and Body"];
        [self.label_image setImage:[UIImage imageNamed:@"mind_body.png"]];
        
    } else {
        [self.label_msg setText:@"More on My Health"];
        [self.label_image setImage:[UIImage imageNamed:@"more_health.png"]];
    }
    
    
}

- (void) saveQuestionsState {
    NSLog(@"saving questions answers");
    
    NSString *tempString = [[self.model.answers valueForKey:@"description"] componentsJoinedByString:@""];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:@"answers.txt"];
    [tempString writeToFile:appFile atomically:YES];
}

- (void) readAnswersSaved {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"answers.txt"];
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath];
    
    
    for (int index = 0; index < fileContent.length; index++) {
        NSString *tempString = [fileContent substringWithRange:NSMakeRange(index, 1)];
        
        if ([tempString isEqualToString:@"1"]) {
            [self.model.answers replaceObjectAtIndex:index withObject:@"1"];
        } else {
            [self.model.answers replaceObjectAtIndex:index withObject:@"0"];
        }
    }
    

    NSLog(@"ANSWERS: %@", fileContent);

}

- (BOOL) checkForAnswers {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"answers.txt"];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:filePath]){
        return YES;
    }
    
    return NO;
}

- (void) clearAnswers {
    [self.model initAnswers];
    [self saveQuestionsState];
    [self.table_view reloadData];
    NSLog(@"Answers cleard");
}

- (void) sendEmail:(id) sender {
    // Email Subject
    NSString *emailTitle = @"A Touch of Health";
    // Email Content
    NSString *messageBody = @"Write subject here.";
    // To address
    NSString *toRecipents = @"contactus@premierlifeplanning.com";
    
    [self sendEmailTo:toRecipents withSubject:emailTitle withBody:messageBody];
    
//    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
//    
//    mailComposer.mailComposeDelegate = self;
//    
//    [mailComposer setTitle:emailTitle];
//    [mailComposer setSubject:messageBody];
//    [mailComposer setToRecipients:toRecipents];
//    
//    // Present mail view controller on screen
//    [self presentViewController:self animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void) sendEmailTo:(NSString *)to withSubject:(NSString *)subject withBody:(NSString *)body {

    
//    NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@"];
//                            [to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
//                            [subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
//                            [body stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    #define mailString @"mailto:sb@sw.com?subject=title&body=content"
    
    NSString *url = [mailString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
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
