//
//  ScoreViewController.m
//  A Touch of Health
//
//  Created by Benjamin on 12/12/16.
//  Copyright © 2016 Nightingale. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readSaveResults];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) readSaveResults {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"results.txt"];
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath];
    NSArray* allLinedStrings = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    self.scores = [[NSMutableArray alloc] initWithArray:allLinedStrings];
    
    for (int index = 0; index < [allLinedStrings count]; index++) {
          NSLog(@"ANSWERS: %@", [allLinedStrings objectAtIndex:index]);
    }
    
  
    
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
