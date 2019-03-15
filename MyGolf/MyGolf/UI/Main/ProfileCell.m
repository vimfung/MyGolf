//
//  ProfileCell.m
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/15.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import "ProfileCell.h"
#import <UIKit/UIKit.h>
#import <VIFoundation/VIFoundation.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "PlayerInfoViewController.h"
#import "ApplicationContext.h"

@interface ProfileCell () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

/**
 头像按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *avatarButton;

/**
 名字标签
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/**
 差点标签
 */
@property (weak, nonatomic) IBOutlet UILabel *handicapLabel;

@end

@implementation ProfileCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //头像按钮圆角
    self.avatarButton.titleLabel.numberOfLines = 0;
    self.avatarButton.layer.masksToBounds = YES;
    self.avatarButton.layer.cornerRadius = self.avatarButton.bounds.size.height * 0.5;
}

- (void)setUser:(User *)user
{
    _user = user;
    
    //填充用户数据
    if (_user)
    {
        if (_user.lastName.length > 0 && _user.firstName.length > 0)
        {
            self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", _user.firstName, _user.lastName];
        }
        else
        {
            self.nameLabel.text = NSLocalizedString(@"我", @"");
        }
        
        if (_user.handicap.length > 0)
        {
            self.handicapLabel.text = [NSString stringWithFormat:NSLocalizedString(@"差点：%@", @""), _user.handicap];
        }
        else
        {
            self.handicapLabel.text = [NSString stringWithFormat:NSLocalizedString(@"差点：%@", @""), @"34"];
        }
        
        [self.avatarButton setImage:nil forState:UIControlStateNormal];
        [self.avatarButton setTitle:NSLocalizedString(@"添加\n照片", @"") forState:UIControlStateNormal];
        
        if (_user.avatar.length > 0)
        {
            [self updateUserAvatar];
        }
    }
    else
    {
        self.nameLabel.text = NSLocalizedString(@"我", @"");
        self.handicapLabel.text = [NSString stringWithFormat:NSLocalizedString(@"差点：%@", @""), @"34"];
        
        [self.avatarButton setImage:nil forState:UIControlStateNormal];
        [self.avatarButton setTitle:NSLocalizedString(@"添加\n照片", @"")
                           forState:UIControlStateNormal];
    }
}

/**
 头像按钮点击事件

 @param sender 事件对象
 */
- (IBAction)avatarButtonClickedHandler:(id)sender
{
    __weak typeof(self) theCell = self;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"拍摄照片", @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.delegate = theCell;
            [[VIFViewController currentViewController] presentViewController:imagePickerController animated:YES completion:nil];
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            hud.label.text = NSLocalizedString(@"不支持拍照功能或没有权限访问", @"");
            hud.mode = MBProgressHUDModeText;
            [hud hideAnimated:YES afterDelay:1.5];
        }
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"选择照片", @"") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePickerController.delegate = theCell;
            [[VIFViewController currentViewController] presentViewController:imagePickerController animated:YES completion:nil];
        }
        else
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            hud.label.text = NSLocalizedString(@"不支持相册功能或没有权限访问", @"");
            hud.mode = MBProgressHUDModeText;
            [hud hideAnimated:YES afterDelay:1.5];
        }
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", @"") style:UIAlertActionStyleCancel handler:nil]];
    
    
    [[VIFViewController currentViewController] presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    //保存头像
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSString *imagePath = [ApplicationContext.defaultContext saveUserAvatarWithImage:image];
    self.user.avatar = imagePath;
    
    [ApplicationContext.defaultContext save];
    
    [self updateUserAvatar];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private

/**
 更新用户头像
 */
- (void)updateUserAvatar
{
    NSURL *avatarURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@", NSHomeDirectory(), self.user.avatar]];
    
    __weak typeof(self) theCell = self;
    VIFImage *avatarImage = [[VIFImage alloc] initWithURL:avatarURL];
    [avatarImage onResult:^(UIImage *image, NSError *error) {
        
        if (!error)
        {
            [theCell.avatarButton setBackgroundImage:image forState:UIControlStateNormal];
            [self.avatarButton setTitle:nil forState:UIControlStateNormal];
        }
        
    }];
}

@end
