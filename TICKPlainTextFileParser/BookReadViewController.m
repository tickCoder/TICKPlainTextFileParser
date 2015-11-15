//
//  BookReadViewController.m
//  TICKPlainTextFileParser
//
//  Created by Milk on 2015.11.14.Saturday.
//  Copyright © 2015 tickCoder. All rights reserved.
//

#import "BookReadViewController.h"

@interface BookReadViewController ()
{
    dispatch_queue_t _parseQueue;
}
- (IBAction)reParse:(id)sender;
@end

const int kReadBufferLength = 1024;

@implementation BookReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [self.filePath lastPathComponent];
    _parseQueue = dispatch_queue_create("com.tickCoder.quque.identifier.parse", DISPATCH_QUEUE_SERIAL);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@", self.filePath);
    
    
    
}

- (void)dealloc {
    _parseQueue = nil;
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
    dispatch_async(_parseQueue, ^{
        
        @autoreleasepool {
            NSData *tFileData = [[NSData alloc] initWithContentsOfFile:_filePath];
            NSString *tFileStr = [[NSString alloc] initWithData:tFileData encoding:NSUTF8StringEncoding];
            NSLog(@"%@", tFileStr?@"utf8":@"no");
        }
//
        
//        NSFileHandle *tFileHandle = [NSFileHandle fileHandleForReadingAtPath:_filePath];
//        unsigned long long tOffset = 0;
//        
//        while ([tFileHandle ]) {
//            <#statements#>
//        }
//        
//        NSData *tBufferData = [tFileHandle readDataOfLength:kReadBufferLength];
//        while (tBufferData) {
//            @autoreleasepool {
//                NSString *tStr = [[NSString alloc] initWithData:tBufferData encoding:NSUTF8StringEncoding];
//                if (tStr) {
//                    NSLog(@"%@", tStr);
//                } else {
//                    NSLog(@"no");
//                }
//            }
//            
//            tBufferData = [tFileHandle readDataOfLength:kReadBufferLength];
//        }
        
        
//        for (int i=1; i<100000; i++) {
//            @autoreleasepool {
//                NSFileHandle *tHandle = [NSFileHandle fileHandleForReadingAtPath:_filePath];
//                NSData *tData = [tHandle readDataOfLength:i];
//                
//                
//                NSString *tStr = [[NSString alloc] initWithData:tData encoding:NSUTF8StringEncoding];
//                if (tStr) {
//                    NSLog(@"%d", i);
//                }
//            }
//        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"=======finished");
        });
    });
    
    
}
@end
