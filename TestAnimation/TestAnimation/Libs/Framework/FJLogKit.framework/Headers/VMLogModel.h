//
//  VMLogModel.h
//  SocketKit
//
//  Created by vargo－mac on 2017/4/24.
//  Copyright © 2017年 vargo－mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMLogModel : NSObject

// log的路径
@property (nonatomic, strong) NSString *logPath;
// log压缩后的路径
@property (nonatomic, strong) NSString *zipPath;
// log压缩后的文件名称 （上传日志的名称）
@property (nonatomic, strong) NSString *uploadName;

@end
