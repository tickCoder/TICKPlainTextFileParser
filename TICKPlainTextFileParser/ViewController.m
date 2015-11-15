//
//  ViewController.m
//  TICKPlainTextFileParser
//
//  Created by Milk on 2015.11.14.Saturday.
//  Copyright © 2015 tickCoder. All rights reserved.
//

#import "ViewController.h"
#import "BookReadViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
- (IBAction)reloadList:(id)sender;
@property (nonatomic, copy) NSArray *bookList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"bookList";
    NSString *tCellIdentifier = NSStringFromClass([UITableViewCell class]);
    [_listTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tCellIdentifier];
    _listTableView.dataSource = self;
    _listTableView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self _tick_reloadBookList];
    [_listTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[BookReadViewController class]]) {
        BookReadViewController *tReadVC = (BookReadViewController *)[segue destinationViewController];
        NSIndexPath *tIndexPath = (NSIndexPath *)sender;
        tReadVC.filePath = [self.bookList objectAtIndex:tIndexPath.row];
    }
}

#pragma mark - Private
- (void)_tick_reloadBookList {
    NSMutableArray *tList = [[NSMutableArray alloc] init];
    
    // Bundle
    NSString *tBookDir = [[NSBundle mainBundle] bundlePath];
    NSLog(@"%@", tBookDir);
    tBookDir = [tBookDir stringByAppendingPathComponent:@"TestBooks"];
    NSArray *tDirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:tBookDir error:nil];
    for (NSString *tFileName in tDirContents) {
        if ([tFileName.pathExtension.lowercaseString isEqualToString:@"txt"]) {
            NSString *tFilePath = [tBookDir stringByAppendingPathComponent:tFileName];
            [tList addObject:tFilePath];
        }
    }
    
    // Document
    NSString *tDocDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@", tDocDir);
    NSArray *tDocContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:tDocDir error:nil];
    for (NSString *tFileName in tDocContents) {
        if ([tFileName.pathExtension.lowercaseString isEqualToString:@"txt"]) {
            NSString *tFilePath = [tDocDir stringByAppendingPathComponent:tFileName];
            [tList addObject:tFilePath];
        }
    }
    
    self.bookList = [NSArray arrayWithArray:tList];
}

#pragma mark - Response
- (IBAction)reloadList:(id)sender {
    [self _tick_reloadBookList];
    [_listTableView reloadData];
}

#pragma mark - Setter & Getter

#pragma mark - Delegate
#pragma mark UITableViewDataSource & Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _bookList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     NSString *tFilePath = [self.fileList objectAtIndex:indexPath.row];
     NSString *tFileName = [tFilePath lastPathComponent];
     NSFileHandle *tFileHandle = [NSFileHandle fileHandleForReadingAtPath:tFilePath];
     NSData *tBeginData = [tFileHandle readDataOfLength:3];
     
     NSString *tBytesStr = @"";
     Byte *tBytes = (Byte *)[tBeginData bytes];
     for (int i=0; i<[tBeginData length]; i++) {
     NSString *tByteStr = [NSString stringWithFormat:@"%x", tBytes[i]];
     tBytesStr = [tBytesStr stringByAppendingFormat:@"%@", tByteStr];
     }
     //NSString *tBytesStr = [NSString stringWithFormat:@"%s", tBytes];
     
     NSString *tLabelStr = [NSString stringWithFormat:@"%@,%@", tBeginData, tFileName];
     */
    
    NSString *tFilePath = [_bookList objectAtIndex:indexPath.row];
    NSString *tFileName = [tFilePath lastPathComponent];
    NSFileHandle *tFileHandle = [NSFileHandle fileHandleForReadingAtPath:tFilePath];
    NSData *tBeginData = [tFileHandle readDataOfLength:3];
    Byte *tBytes = (Byte *)[tBeginData bytes];
    NSString *tLabelStr = [NSString stringWithFormat:@"%@:%@", tBeginData, tFileName];
    
    NSLog(@"%@, %@", tFileName, tBeginData);
    
    NSString *tCellIdentifier = NSStringFromClass([UITableViewCell class]);
    UITableViewCell *tCell = [tableView dequeueReusableCellWithIdentifier:tCellIdentifier];
    tCell.accessoryType = UITableViewCellAccessoryDetailButton;
    tCell.textLabel.text = tLabelStr;
    
    return tCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 在真正push之前，会调用prepareForSegue
    [self performSegueWithIdentifier:@"listToRead" sender:indexPath];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSString *tFileName = [[_bookList objectAtIndex:indexPath.row] lastPathComponent];
    UIAlertController *tAlert = [UIAlertController alertControllerWithTitle:@"提示" message:tFileName preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *tCancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [tAlert addAction:tCancelAction];
    [self presentViewController:tAlert animated:YES completion:nil];
}
@end
