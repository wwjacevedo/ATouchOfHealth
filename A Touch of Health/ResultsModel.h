//
//  ResultsModel.h
//  A Touch of Health
//
//  Created by Benjamin on 12/13/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultsModel : NSObject

@property (strong, nonatomic) NSArray *firstMsgs;
@property (strong, nonatomic) NSArray *secondMsgs;

- (void) initMsgs;

@end
