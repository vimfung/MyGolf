//
//  ApplicationContext.h
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/15.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User+CoredataClass.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 应用上下文
 */
@interface ApplicationContext : NSObject

/**
 当前用户
 */
@property (nonatomic, strong, readonly) User *currentUser;

/**
 获取默认上下文对象

 @return 上下文对象
 */
+ (instancetype)defaultContext;

/**
 保存用户头像

 @param image 头像图片
 @return 图片路径，基于根目录的相对路径
 */
- (NSString *)saveUserAvatarWithImage:(UIImage *)image;

/**
 保存数据
 */
- (void)save;

@end

NS_ASSUME_NONNULL_END
