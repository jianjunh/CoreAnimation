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
 * 动画section
 */
@property (nonatomic,strong) NSArray *animationSectionList;

/**
 * 基础动画列表
 */
@property (nonatomic,strong) NSArray *basicAnimationList;

/**
 * 关键帧动画列表
 */
@property (nonatomic,strong) NSArray *keyframeAnimationList;


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
    self.animationSectionList = @[@"基础动画",@"关键帧动画"];
    self.basicAnimationList = @[@{@"name" : @"位移动画", @"VCName" : @"KGWMoveViewController"},@{@"name" : @"旋转动画", @"VCName" : @"KGWRotationViewController"},@{@"name" : @"缩放动画", @"VCName" : @"KGWScaleViewController"},@{@"name" : @"透明度动画", @"VCName" : @"KGWOpacityViewController"},@{@"name" : @"背景色动画", @"VCName" : @"KGWBackgroundColorViewController"}];
    self.keyframeAnimationList = @[@{@"name" : @"使用Values数组创建关键帧动画", @"VCName" : @"KGWKeyframeValuesViewController"},@{@"name" : @"使用path路径创建关键帧动画", @"VCName" : @"KGWKeyframePathViewController"},@{@"name" : @"使用values数组创建抖动关键帧动画", @"VCName" : @"KGWShakeViewController"},@{@"name" : @"基础动画和关键帧动画同时进行", @"VCName" : @"KGWSameTimeAnimationViewController"},@{@"name" : @"基础动画和关键帧动画连续进行", @"VCName" : @"KGWKGWContinuousAnimationViewController"}];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.animationSectionList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.basicAnimationList.count;
            break;
        case 1:
            return self.keyframeAnimationList.count;
            break;
        default:
            break;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.animationSectionList[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            NSDictionary *dict = [self.basicAnimationList objectAtIndex:indexPath.row];
            cell.textLabel.text = [dict valueForKey:@"name"];
            return cell;
        }
            break;
        case 1:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            NSDictionary *dict = [self.keyframeAnimationList objectAtIndex:indexPath.row];
            cell.textLabel.text = [dict valueForKey:@"name"];
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            NSDictionary *dict = [self.basicAnimationList objectAtIndex:indexPath.row];
            NSString *VCName = [dict valueForKey:@"VCName"];
            UIViewController *vc = [NSClassFromString(VCName) new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            NSDictionary *dict = [self.keyframeAnimationList objectAtIndex:indexPath.row];
            NSString *VCName = [dict valueForKey:@"VCName"];
            UIViewController *vc = [NSClassFromString(VCName) new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
