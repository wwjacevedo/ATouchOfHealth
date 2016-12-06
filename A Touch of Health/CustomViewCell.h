//
//  CustomViewCell.h
//  A Touch of Health
//
//  Created by Benjamin on 12/6/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *noButton;
@property (weak, nonatomic) IBOutlet UIButton *yesButton;
@property (weak, nonatomic) IBOutlet UILabel *question;

@end
