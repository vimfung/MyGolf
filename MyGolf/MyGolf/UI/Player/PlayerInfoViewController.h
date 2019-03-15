//
//  PlayerViewController.h
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/15.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User+CoredataClass.h"

NS_ASSUME_NONNULL_BEGIN

/**
 选手信息视图控制器
 */
@interface PlayerInfoViewController : UITableViewController

/**
 初始化

 @param user 用户信息
 @return 视图控制器
 */
- (instancetype)initWithUser:(User *)user;

/**
 用户更新时触发

 @param block 事件处理器
 */
- (void)onUserUpdate:(void (^)(User *user))block;

@end

NS_ASSUME_NONNULL_END
