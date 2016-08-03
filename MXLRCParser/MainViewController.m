//
//  MainViewController.m
//  MXLRCParser
//
//  Created by 韦纯航 on 16/8/3.
//  Copyright © 2016年 韦纯航. All rights reserved.
//

#import "MainViewController.h"

#import "DetailViewController.h"

@interface MainViewController ()

@property (copy, nonatomic) NSArray <NSDictionary *> *items;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"MXLRCParser";
    self.tableView.rowHeight = 60.0;
    self.tableView.tableFooterView = [UIView new];
    
    UIBarButtonItem *returnButtonItem = [[UIBarButtonItem alloc] init];
    returnButtonItem.title = @"返回";
    self.navigationItem.backBarButtonItem = returnButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray <NSDictionary *> *)items
{
    if (_items == nil) {
        _items = @[@{@"t" : @"解析普通格式歌词", @"s" : @"例如：[00:00.00]歌词歌词歌词", @"r" : @"韩宝仪-粉红色的回忆0.lrc"},
                   @{@"t" : @"解析多个时间标签歌词", @"s" : @"例如：[00:00.00][01:00.00]歌词歌词歌词", @"r" : @"韩宝仪-粉红色的回忆1.lrc"},
                   @{@"t" : @"解析带网页格式的歌词", @"s" : @"例如：[00&#58;00&#46;00]歌词歌词歌词&#13;&#10;", @"r" : @"韩宝仪-粉红色的回忆2.lrc"},
                   @{@"t" : @"解析单行形式歌词", @"s" : @"例如：[00:00.00]歌词[00:03.00]歌词歌词[01:00.00]歌词歌词歌词", @"r" : @"韩宝仪-粉红色的回忆3.lrc"}];
    }
    return _items;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    }
    
    NSDictionary *item = self.items[indexPath.row];
    cell.textLabel.text = item[@"t"];
    cell.detailTextLabel.text = item[@"s"];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *item = self.items[indexPath.row];
    NSString *lrcPath = [[NSBundle mainBundle] pathForResource:item[@"r"] ofType:nil];
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithLRCPath:lrcPath];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
