//
//  IFlyFunctions.h
//  IFlyDemo
//
//  Created by shenhongbang on 2016/12/9.
//  Copyright © 2016年 中移(杭州)信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *IFlyStringWithJson(NSString *jsonStr);

/**
 语音听写

 @param result 回调里的result
 @return 识别后的字段
 */
NSString *IFlyStringWithResult(NSArray *result);
