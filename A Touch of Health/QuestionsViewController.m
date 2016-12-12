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
    
    if (self.checkForAnswers) {
        NSLog(@"ANSWERS : YES");
        self.readAnswersSaved;
    } else {
        NSLog(@"NO ANSWERS");
    }
    
    _model = [[QuestionsModel alloc] init];
    [_model initQuestionsAndAnswers];
    _table_view.delegate = self;
    _table_view.dataSource = self;
    
    if (_moreQuestions) {
        _numOfQuestions = 20;
    } else {
        _numOfQuestions = 15;
    }
    
//    _back_button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(back:)];
        [self.save_button addTarget:self action:@selector(saveQuestionsState) forControlEvents:UIControlEventTouchUpInside];
    
//    self.back_button = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(back)];
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

//- (NSString *)tableView:(UITableView *) tableView titleForHeaderInSection:(NSInteger) section {
//    switch (section) {
//        case 1:
//            return @"Exercise & Nutrition";
//            break;
//        case 2:
//            return @"Meds for Health";
//            break;
//        case 3:
//            return @"Mind and Body";
//            break;
//        case 4:
//            return @"More on My Health";
//            break;
//        default:
//            return @"";
//            break;
//    }
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat height = scrollView.frame.size.height;
    
    CGFloat contentYoffset = scrollView.contentOffset.y;
    
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
    
    if(distanceFromBottom < height)
    {
//        NSLog(@"end of the table");
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
        
        if ([[_model.answers objectAtIndex:indexPath.row] isEqual :@YES]) {
            [table_view_cell.yesButton setEnabled:@YES];
            [table_view_cell.noButton setEnabled:@NO];
        } else {
            [table_view_cell.yesButton setEnabled:@NO];
            [table_view_cell.noButton setEnabled:@YES];
        }
    }
    
    if ([[self.model.answers objectAtIndex:indexPath.row]  isEqual: @NO]) {
        [table_view_cell.noButton setBackgroundColor:[UIColor colorWithRed:0.63 green:0.60 blue:0.87 alpha:1.0]];
        [table_view_cell.noButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected & UIControlStateNormal];
        
        [table_view_cell.yesButton setBackgroundColor:[UIColor whiteColor]];
        [table_view_cell.yesButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected & UIControlStateNormal];
        
    } else {
        [table_view_cell.yesButton setBackgroundColor:[UIColor colorWithRed:0.63 green:0.60 blue:0.87 alpha:1.0]];
        [table_view_cell.yesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected & UIControlStateNormal];
        
        [table_view_cell.noButton setBackgroundColor:[UIColor whiteColor]];
        [table_view_cell.noButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected & UIControlStateNormal];
    }
    
    return table_view_cell;
}

- (void) yesButtonTapped:(UIButton *) button {
    
    NSInteger index = button.tag;

    if (button.isEnabled) {
        [self.model.answers replaceObjectAtIndex:index withObject:@YES];
        [self.table_view reloadData];

    } else {
        [self.model.answers replaceObjectAtIndex:index withObject:@NO];
        [self.table_view reloadData];
    }
}

- (void) noButtonTapped:(UIButton *) button {
    
    NSInteger index = button.tag;
    
    if (button.isEnabled) {
        [self.model.answers replaceObjectAtIndex:index withObject:@NO];
        [self.table_view reloadData];
        
    } else {
        [self.model.answers replaceObjectAtIndex:index withObject:@YES];
        [self.table_view reloadData];
    }
}

- (void) manageHeaderImageAndMsgRespectTo :(NSIndexPath *) indexPath {
    
    NSInteger index = (NSInteger) indexPath.row;
    
    
    self.label_image.contentMode = UIViewContentModeScaleAspectFit;
    
    if (index < 5) {
        [self.label_msg setText:@"Exercise & Nutritioin"];
        [self.label_image setImage:[UIImage imageNamed:@"exercise.png"]];
        self.label_image.contentMode = UIViewContentModeScaleToFill;
        
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

//Header back button action
- (void) back:(UIBarButtonItem *) button {
    [self.navigationController popViewControllerAnimated:YES];
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
            [self.model.answers addObject:@YES];
        } else {
            [self.model.answers addObject:@NO];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
