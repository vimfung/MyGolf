//
//  PlayerViewController.m
//  MyGolf
//
//  Created by 冯鸿杰 on 2019/3/15.
//  Copyright © 2019年 Chengq. All rights reserved.
//

#import "PlayerInfoViewController.h"
#import "PlayerInfoCell.h"

@interface PlayerInfoViewController ()

/**
 选手信息单元格
 */
@property (nonatomic, weak) PlayerInfoCell *playerInfoCell;

/**
 用户信息
 */
@property (nonatomic, strong) User *user;

/**
 用户更新处理器
 */
@property (nonatomic, copy) void (^userUpdateHandler)(User *user);

@end

@implementation PlayerInfoViewController

- (instancetype)initWithUser:(User *)user
{
    if (self = [super init])
    {
        self.title = NSLocalizedString(@"选手", @"");
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"完成", @"") style:UIBarButtonItemStylePlain target:self action:@selector(completeButtonClickedHandler:)];
        
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UINib *playerInfoCellNib = [UINib nibWithNibName:@"PlayerInfoCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:playerInfoCellNib forCellReuseIdentifier:@"PlayerInfoCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerInfoCell" forIndexPath:indexPath];
    self.playerInfoCell = cell;
    cell.user = self.user;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 206;
}

- (void)onUserUpdate:(void (^)(User *user))block
{
    self.userUpdateHandler = block;
}

#pragma mark - Private

- (void)completeButtonClickedHandler:(id)sender
{
    [self.playerInfoCell submitData];
    if (self.userUpdateHandler)
    {
        self.userUpdateHandler(self.user);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
