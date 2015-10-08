//
//  ViewController.m
//  FWRClassifyChooseViewDemo
//
//  Created by 冯伟如 on 15/9/30.
//  Copyright © 2015年 冯伟如. All rights reserved.
//

#import "ViewController.h"
#import "ClassifyChooseView.h"

#define MAINSCREEN [[UIScreen mainScreen] bounds]

@interface ViewController ()<ClassifyChooseViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"例子";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *categoryArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"];
    
    NSMutableArray *detailArray = [NSMutableArray array];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4"]];
    [detailArray addObject:@[@"0",@"1"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    [detailArray addObject:@[@"0",@"1"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
    [detailArray addObject:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
    
    ClassifyChooseView *view = [[ClassifyChooseView alloc] initWithFrame:CGRectMake(0, 64, MAINSCREEN.size.width, MAINSCREEN.size.height-64) sectionArray:categoryArray itemArray:detailArray];
    view.delegate = self;
    [self.view addSubview:view];
}

#pragma mark - ClassifyChooseView代理
-(void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *message = [NSString stringWithFormat:@"第%d组第%d个",indexPath.section,indexPath.row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你点击了" message:message preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
