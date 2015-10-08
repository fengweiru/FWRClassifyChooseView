//
//  ClassifyChooseView.m
//  FWRClassifyChooseViewDemo
//
//  Created by 冯伟如 on 15/9/30.
//  Copyright © 2015年 冯伟如. All rights reserved.
//

#import "ClassifyChooseView.h"

@interface ClassifyChooseView ()<UICollectionViewDataSource,UICollectionViewDelegate>
//长
@property (nonatomic, assign)CGFloat myHeight;
//宽
@property (nonatomic, assign)CGFloat myWidth;
//组名数组
@property (nonatomic, strong)NSArray *sectionArray;
//具体每一个的二维数组
@property (nonatomic, strong)NSArray *itemArray;
//左边的scrollView
@property (nonatomic, strong)UIScrollView *scrollView;
//右边的collectionView
@property (nonatomic, strong)UICollectionView *collectionView;
//上一个选择的tag
@property (nonatomic, assign)NSInteger lastTag;
//当前选择的
@property (nonatomic, assign)NSInteger currentCategory;

@end

@implementation ClassifyChooseView

-(instancetype)initWithFrame:(CGRect)frame sectionArray:(NSArray *)sectionArray itemArray:(NSArray *)itemArray
{
    self = [super initWithFrame:frame];
    if (self) {
        self.myHeight = frame.size.height;
        self.myWidth = frame.size.width;
        
        self.sectionArray = sectionArray;
        
        self.itemArray = itemArray;
        
        [self createScrollView];
        
        [self createCollectionView];
    }
    return self;
}

-(void)createCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.itemSize = CGSizeMake((self.myWidth-80-30)/3, 50);
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(80, 0, self.myWidth-80, self.myHeight-64-49) collectionViewLayout:flowLayout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    [self addSubview:_collectionView];
}

-(void)createScrollView{
    

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 80, self.myHeight-64-49)];
    _scrollView.showsVerticalScrollIndicator = NO;   //去掉竖的滑条
    [self addSubview:_scrollView];
    
    _lastTag = 0;
    
    for (int i = 0; i < _sectionArray.count; i++) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 50*i, 80, 50)];
        bgView.backgroundColor = [UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:1.0];
        bgView.tag = 300 + i;
        bgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *g = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseAction:)];
        [bgView addGestureRecognizer:g];
        [_scrollView addSubview:bgView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(3, 0, 79.7, 49.7)];
        label.text = _sectionArray[i];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 200;
        [bgView addSubview:label];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, 49.7)];
        view.backgroundColor = [UIColor clearColor];
        view.tag = 100;
        [bgView addSubview:view];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, 79.7, 0.3)];
        lineView.backgroundColor = [UIColor grayColor];
        [bgView addSubview:lineView];
        
        UIView *verLineView = [[UIView alloc] initWithFrame:CGRectMake(79.7, 0, 0.3, 50)];
        verLineView.backgroundColor = [UIColor grayColor];
        verLineView.tag = 400;
        [bgView addSubview:verLineView];
        
        if (i == 0) {
            bgView.backgroundColor = [UIColor whiteColor];
            label.textColor = [UIColor colorWithRed:234/255.0 green:43/255.0 blue:50/255.0 alpha:1.0];
            view.backgroundColor = [UIColor colorWithRed:234/255.0 green:43/255.0 blue:50/255.0 alpha:1.0];
            verLineView.backgroundColor = [UIColor clearColor];
            _lastTag = 300;
        }
    }
    
    _currentCategory = 0;
    _scrollView.contentSize = CGSizeMake(80, _sectionArray.count*50);
    
}

-(void)chooseAction:(UITapGestureRecognizer *)g
{
    UIView *lastView = (UIView *)[_scrollView viewWithTag:_lastTag];
    UILabel *lbl = (UILabel *)[lastView viewWithTag:200];
    UIView *vie = (UIView *)[lastView viewWithTag:100];
    UIView *verVie = (UIView *)[lastView viewWithTag:400];
    lastView.backgroundColor = [UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:1.0];
    lbl.textColor = [UIColor blackColor];
    vie.backgroundColor = [UIColor clearColor];
    verVie.backgroundColor = [UIColor grayColor];
    
    UIView *currentView = (UIView *)g.view;
    UILabel *label = (UILabel *)[currentView viewWithTag:200];
    UIView *view = (UIView *)[currentView viewWithTag:100];
    UIView *verView = (UIView *)[currentView viewWithTag:400];
    currentView.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor colorWithRed:234/255.0 green:43/255.0 blue:50/255.0 alpha:1.0];
    view.backgroundColor = [UIColor colorWithRed:234/255.0 green:43/255.0 blue:50/255.0 alpha:1.0];
    verView.backgroundColor = [UIColor clearColor];
    _lastTag = currentView.tag;
    
    _currentCategory = currentView.tag-300;
    [_collectionView reloadData];
}

#pragma mark - UICollectionView代理
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *array = _itemArray[_currentCategory];
    return array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = _itemArray[_currentCategory];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:1.0];
    
    for (UIView *subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, (375-80-30)/3, 50)];
    label.text = array[indexPath.item];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16];
    [cell.contentView addSubview:label];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate) {
        [self.delegate didSelectItemAtIndexPath:indexPath];
    }
}

@end
