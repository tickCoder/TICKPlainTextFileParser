//
//  TICKPlainTextFileParser.m
//  TICKPlainTextFileParser
//
//  Created by Milk on 2015.11.14.Saturday.
//  Copyright © 2015 tickCoder. All rights reserved.
//

#import "TICKPlainTextFileParser.h"

@interface TICKPlainTextFileParser () {

}
@property (nonatomic, copy, readwrite) NSString *filePath;
@property (nonatomic, assign, readwrite, getter=isSync) BOOL sync;
@end

@implementation TICKPlainTextFileParser
- (instancetype)initWithFilePath:(NSString *)aFilePath {
    self = [super init];
    if (self) {
        _filePath = aFilePath;
    }
    return self;
}

- (void)parse:(BOOL)aSync {
    _sync = aSync;
    
}

#pragma mark - Private
- (void)_tick_checkEncoding {
}

@end
