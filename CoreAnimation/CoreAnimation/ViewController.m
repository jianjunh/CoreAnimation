//
//  ViewController.m
//  CoreAnimation
//
//  Created by junjian_h@163.com on 2020/1/31.
//  Copyright © 2020年 junjian_h@163.com. All rights reserved.
//

#import "ViewController.h"

static NSString *cellId = @"cellId";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/**
 * 动画列表
 */
@property (nonatomic,strong) NSArray *animationList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self commitInit];
    UITableView *animationTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    animationTableView.delegate = self;
    animationTableView.dataSource = self;
    [animationTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    [self.view addSubview:animationTableView];
}

- (void)commitInit {
    self.title = @"动画";
    self.animationList = @[@{@"name" : @"位移动画", @"VCName" : @"KGWMoveViewController"},@{@"name" : @"旋转动画", @"VCName" : @"KGWRotationViewController"},@{@"name" : @"缩放动画", @"VCName" : @"KGWScaleViewController"},@{@"name" : @"透明度动画", @"VCName" : @"KGWOpacityViewController"},@{@"name" : @"背景色动画", @"VCName" : @"KGWBackgroundColorViewController"}];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animationList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    NSDictionary *dict = [self.animationList objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict valueForKey:@"name"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [self.animationList objectAtIndex:indexPath.row];
    NSString *VCName = [dict valueForKey:@"VCName"];
    UIViewController *vc = [NSClassFromString(VCName) new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
