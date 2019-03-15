//
//  ApplicationContext.m
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/15.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import "ApplicationContext.h"
#import <VIFoundation/VIFoundation.h>
#import "User+CoredataClass.h"

@interface ApplicationContext ()

/**
 存储服务
 */
@property (nonatomic, strong) VIFCoreDataHelper *dataHelper;

/**
 数据服务
 */
@property (nonatomic, strong) VIFDataService *dataService;

@end

@implementation ApplicationContext

+ (instancetype)defaultContext
{
    static ApplicationContext *context = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        context = [[ApplicationContext alloc] init];
    });
    
    return context;
}

- (instancetype)init
{
    if (self = [super init])
    {
        self.dataService = [VIFDataService sharedInstance];
        self.dataHelper = [[VIFCoreDataHelper alloc] initWithDataModel:@"MyGolf"];
        
        //初始化数据
        [self _initData];
        
        //获取当前用户
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isOwner == YES"];
        _currentUser = [self.dataHelper selectObjectsWithEntityName:@"User" condition:predicate sort:nil error:nil].firstObject;
    }
    return self;
}

- (NSString *)saveUserAvatarWithImage:(UIImage *)image
{
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    NSString *imageName = [VIFCrypto stringByMD5Data:imageData];
    NSString *imagePath = [NSString stringWithFormat:@"/Library/Caches/%@.jpg", imageName];
    [imageData writeToFile:[NSString stringWithFormat:@"%@%@", NSHomeDirectory(), imagePath]
                atomically:YES];
    
    return imagePath;
}

- (void)save
{
    [self.dataHelper flush:nil];
}

#pragma mark - Private

/**
 初始化数据
 */
- (void)_initData
{
    if (![[self.dataService cacheDataForKey:@"hasInitData" domain:nil] boolValue])
    {
        [self.dataService setCacheData:@(YES) forKey:@"hasInitData" domain:nil];
        
        //初始化自身用户
        User *ownerUser = [self.dataHelper createObjectWithName:@"User"];
        ownerUser.isOwner = YES;
        
        [self.dataHelper flush:nil];
    }
}

@end
