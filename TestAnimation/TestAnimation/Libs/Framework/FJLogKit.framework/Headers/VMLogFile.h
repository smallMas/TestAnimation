//
//  VMLogFile.h
//  Vmessage
//
//  Created by vargo－mac on 16/9/2.
//  Copyright © 2016年 vargo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMLogModel.h"

// Define
#ifdef __cplusplus
#define CC_EXTERN  extern "C" __attribute__((visibility ("default")))
#else
#define CC_EXTERN  extern __attribute__((visibility ("default")))
#endif

#define CC_IS_Write YES

#define CC_LOG(...) \
CCLog (CC_IS_Write, __VA_ARGS__)

//#define CC_LOG(...) NSLog(__VA_ARGS__)

// Log
CC_EXTERN void CCLog (BOOL isWrite, NSString *format, ...);

@interface VMLogFile : NSObject

+ (instancetype)sharedInstance;

// 设置是否写入文件，默认YES
- (void)setWriteToFileEnable:(BOOL)enable;

// 设置是否使用默认日志文件名，默认NO
- (void)setUseDefaultLogNameEnable:(BOOL)enable;

// 设置App code,添加在日志文件名中
- (void)setAppCode:(NSString *)code phone:(NSString *)phone;

// log
- (void)logString:(NSString *)logString;

// 检查日志，发送今天之前的日志
- (void)checkLogs:(void (^)(NSArray *paths))block;

// 查询所有日志文件
//- (NSArray *)allFiles;
//- (NSString *)localDirectory;

// 删除文件
- (BOOL)deleteLogPath:(NSString *)filePath;

@end
