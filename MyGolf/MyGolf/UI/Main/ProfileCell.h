//
//  ProfileCell.h
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/15.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User+CoredataClass.h"

NS_ASSUME_NONNULL_BEGIN

/**
 个人信息单元格
 */
@interface ProfileCell : UITableViewCell

/**
 用户信息
 */
@property (nonatomic, strong) User *user;

@end

NS_ASSUME_NONNULL_END
