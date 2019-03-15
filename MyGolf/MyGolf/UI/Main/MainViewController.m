//
//  ViewController.m
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/14.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import "MainViewController.h"
#import "ProfileCell.h"
#import "ApplicationContext.h"
#import "PlayerInfoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    UINib *profileNib = [UINib nibWithNibName:@"ProfileCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:profileNib forCellReuseIdentifier:@"ProfileCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 3;
        case 1:
            return 4;
        case 2:
            return 1;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"Cell";
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        cellId = @"ProfileCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    switch (indexPath.section)
    {
        case 0:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    //我的
                    ProfileCell *profileCell = (ProfileCell *)cell;
                    profileCell.user = ApplicationContext.defaultContext.currentUser;
                    break;
                }
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"新回合", @"");
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"球场", @"");
                    break;
                default:
                    break;
            }
            break;
        }
        case 1:
        {
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"账户与设置", @"");
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"统计数据", @"");
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"保存的回合", @"");
                    break;
                case 3:
                    cell.textLabel.text = NSLocalizedString(@"选手", @"");
                    break;
                default:
                    break;
            }
            break;
        }
        case 2:
        {
            switch (indexPath.row)
            {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"支持", @"");
                    break;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        return 98;
    }
    
    return tableView.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        __weak typeof(self) theView = self;
        PlayerInfoViewController *playerInfoVC = [[PlayerInfoViewController alloc] initWithUser:ApplicationContext.defaultContext.currentUser];
        [playerInfoVC onUserUpdate:^(User * _Nonnull user) {
            
            //刷新数据
            [theView.tableView reloadData];
            
        }];
        
        [self.navigationController pushViewController:playerInfoVC animated:YES];
    }
}

@end
