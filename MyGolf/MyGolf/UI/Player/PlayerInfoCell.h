//
//  PlayerInfoCell.h
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/15.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User+CoredataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerInfoCell : UITableViewCell

/**
 用户信息
 */
@property (nonatomic, strong) User *user;


/**
 提交数据到实体
 */
- (void)submitData;

@end

NS_ASSUME_NONNULL_END
