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
    _userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([_userDefaults objectForKey:@"agreed"]) {
        [self toggleButton];
    }
    
    [self.contact_us_buttons addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchUpInside];
    [self.agree_to_policy_button addTarget:self action:@selector(toggleButton) forControlEvents:UIControlEventTouchUpInside];
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

- (void) toggleButton {
    [self.agree_to_policy_button setImage:[UIImage imageNamed:@"selectedRadioButton.png" inBundle:nil compatibleWithTraitCollection:nil] forState:UIControlStateSelected];
    [self.agree_to_policy_button setSelected:YES];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@YES forKey:@"agreed"];
}


@end
