//
//  BookReadViewController.m
//  TICKPlainTextFileParser
//
//  Created by Milk on 2015.11.14.Saturday.
//  Copyright © 2015 tickCoder. All rights reserved.
//

#import "BookReadViewController.h"

@interface BookReadViewController ()
- (IBAction)reParse:(id)sender;
@end

@implementation BookReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [self.filePath lastPathComponent];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@", self.filePath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)reScan:(id)sender {
}
- (IBAction)reParse:(id)sender {
}
@end
