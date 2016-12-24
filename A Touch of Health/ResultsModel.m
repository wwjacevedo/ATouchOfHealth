//
//  ResultsModel.m
//  A Touch of Health
//
//  Created by Benjamin on 12/13/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import "ResultsModel.h"

@implementation ResultsModel

- (void) initMsgs {
    self.firstMsgs = @[@"Congratulations, You are in touch with your health and wellness! We are also available to help support you and your continued journey.",
                       @"We would like to learn more about how we can help you on your journey to health and wellness!",
                       @"We noticed there are some areas where you may benefit from additional support on your journey toward health and wellness. We are here to help you!"];
    self.secondMsgs = @[@"Let us know how we can help you and/or your family members and friends by contacting us below using the contact us link",
                        @"Send us an email at contactus@premierlifplanning.com and we'd be happy to help you on your continued journey.",
                        @"The first step is as easy as emailing us at: contactus@premierlifeplanning.com"];
}

@end
