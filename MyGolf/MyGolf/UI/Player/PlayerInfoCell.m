//
//  PlayerInfoCell.m
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/15.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import "PlayerInfoCell.h"
#import "ApplicationContext.h"
#import <VIFoundation/VIFoundation.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Masonry/Masonry.h>

@interface PlayerInfoCell () <UIImagePickerControllerDelegate,
                              UINavigationControllerDelegate,
                              UITextFieldDelegate,
                              UIPickerViewDataSource,
                              UIPickerViewDelegate>

/**
 头像按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *avatarButton;

/**
 名字编辑框
 */
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;

/**
 姓氏编辑框
 */
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

/**
 邮箱编辑框
 */
@property (weak, nonatomic) IBOutlet UITextField *mailTextField;

/**
 差点编辑框
 */
@property (weak, nonatomic) IBOutlet UITextField *handicapTextField;

/**
 头像路径
 */
@property (nonatomic, copy) NSString *avatarPath;

@end

@implementation PlayerInfoCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    //头像按钮圆角
    self.avatarButton.titleLabel.numberOfLines = 0;
    self.avatarButton.layer.masksToBounds = YES;
    self.avatarButton.layer.cornerRadius = self.avatarButton.bounds.size.height * 0.5;
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 260)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    self.handicapTextField.inputView = pickerView;
    
    __weak typeof(self) theCell = self;
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.bottom.equalTo(theCell.handicapTextField.inputView);
        
    }];
}

- (void)setUser:(User *)user
{
    _user = user;
    
    if (_user)
    {
        self.firstNameTextField.text = self.user.firstName;
        self.lastNameTextField.text = self.user.lastName;
        self.handicapTextField.text = self.user.handicap;
        self.mailTextField.text = self.user.mail;
        
        [self.avatarButton setImage:nil forState:UIControlStateNormal];
        [self.avatarButton setTitle:NSLocalizedString(@"添加\n照片", @"") forState:UIControlStateNormal];
        
        if (_user.avatar.length > 0)
        {
            self.avatarPath = _user.avatar;
            [self updateUserAvatar];
        }
    }
}

- (void)submitData
{
    self.user.firstName = self.firstNameTextField.text;
    self.user.lastName = self.lastNameTextField.text;
    self.user.handicap = self.handicapTextField.text;
    self.user.mail = self.mailTextField.text;
    self.user.avatar = self.avatarPath;
    
    [ApplicationContext.defaultContext save];
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

#pragma mark - Private

/**
 更新用户头像
 */
- (void)updateUserAvatar
{
    NSURL *avatarURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@%@", NSHomeDirectory(), self.avatarPath]];
    
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

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    //保存头像
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.avatarPath = [ApplicationContext.defaultContext saveUserAvatarWithImage:image];
    
    [self updateUserAvatar];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.handicapTextField)
    {
        
    }
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            return 65;
        case 1:
            if ([pickerView selectedRowInComponent:0] == 64)
            {
                //最后一行没有小数
                return 1;
            }
            return 10;
        default:
            return 0;
    }
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            if (row < 10)
            {
                return [NSString stringWithFormat:@"+%ld", (long)(9 - row)];
            }
            else
            {
                return [NSString stringWithFormat:@"%ld", row - 10];
            }
        case 1:
            return [NSString stringWithFormat:@".%ld", (long)row];
        default:
            return  @"";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [pickerView reloadComponent:1];
    
    NSInteger row1 = [pickerView selectedRowInComponent:0];
    NSInteger row2 = [pickerView selectedRowInComponent:1];
    
    NSString *row1String = [self pickerView:pickerView titleForRow:row1 forComponent:0];
    NSString *row2String = [self pickerView:pickerView titleForRow:row2 forComponent:1];
    
    self.handicapTextField.text = [NSString stringWithFormat:@"%@%@", row1String, row2String];
}

@end
