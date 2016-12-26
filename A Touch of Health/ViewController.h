//
//  ViewController.h
//  A Touch of Health
//
//  Created by Benjamin on 12/5/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *contact_us_buttons;
@property (strong, nonatomic) IBOutlet UIButton *agree_to_policy_button;
@property (weak, nonatomic) NSUserDefaults *userDefaults;

@end

