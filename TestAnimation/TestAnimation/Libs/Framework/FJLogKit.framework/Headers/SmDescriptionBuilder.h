//
//  SmDescriptionBuilder.h
//  SmKit
//
//  Created by fanshijian on 15/9/22.
//  Copyright (c) 2015年 fanshijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmDescriptionBuilder : NSObject
{
@private
    id _obj;
    NSMutableDictionary *_keyValuePairs;
}

/** 
 *  @brief 反射
 * 
 *  @param obj 反射对象
 *
 *  @return 字符串
 **/
+ (NSString *)reflectionToString:(id)obj;

@end
