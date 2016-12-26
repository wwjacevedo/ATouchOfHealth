//
//  ResultsViewController.m
//  A Touch of Health
//
//  Created by Benjamin on 12/13/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.model = [[ResultsModel alloc] init];
    [self.model initMsgs];
    self.results = 0;
    
    [self readAnswersSaved];
    [self displayMsgs];
    
    [self.contact_us_button addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchUpInside];
    [self.geriatric_care_button addTarget:self action:@selector(goToGeriatricSite) forControlEvents:UIControlEventTouchUpInside];
    [self.life_planning_button addTarget:self action:@selector(goToLifePlanningSite) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) readAnswersSaved {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"answers.txt"];
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath];
    
    
    for (int index = 0; index < 15; index++) {
        NSString *tempString = [fileContent substringWithRange:NSMakeRange(index, 1)];
        
        if ([tempString isEqualToString:@"1"]) {
            self.results++;
        }
    }
    
}

- (void) displayMsgs {
    int index  = [self calculateResults];
    [self.msg_one setText:[self.model.firstMsgs objectAtIndex:index]];
    [self.msg_two setText:[self.model.secondMsgs objectAtIndex:index]];
}

- (int) calculateResults {
    
    if (_results <= 5) {
        //Low Gradient
        return 0;
    } else if (_results > 5 && _results <= 10) {
        //Medium Gradient
        return 1;
    } else {
        //High Gradient
        return 2;
    }
}

- (void) goToGeriatricSite {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://premiergeriatricrn.com"]];
}

- (void) goToLifePlanningSite {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://premierlifeplanning.com"]];
}

- (void) sendEmailTo:(NSString *)to withSubject:(NSString *)subject withBody:(NSString *)body {
    
    #define mailString @"mailto:contactus@premierlifeplanning.com?subject=A Touch of Health&body=Write here!"
    
    NSString *url = [mailString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:nil];
}

- (void) sendEmail {
    // Email Subject
    NSString *emailTitle = @"A Touch of Health";
    // Email Content
    NSString *messageBody = @"Write subject here.";
    // To address
    NSString *toRecipents = @"contactus@premierlifeplanning.com";
    
    [self sendEmailTo:toRecipents withSubject:emailTitle withBody:messageBody];
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
