//
//  ViewController.m
//  A Touch of Health
//
//  Created by Benjamin on 12/5/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.contact_us_buttons addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchUpInside];
    self.agree_to_policy_button = [[UIButton alloc] initWithFrame:CGRectMake(10,10,100,100)];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


@end
