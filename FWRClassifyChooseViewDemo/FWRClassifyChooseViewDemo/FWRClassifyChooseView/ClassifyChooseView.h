//
//  ClassifyChooseView.h
//  FWRClassifyChooseViewDemo
//
//  Created by 冯伟如 on 15/9/30.
//  Copyright © 2015年 冯伟如. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClassifyChooseViewDelegate <NSObject>

- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ClassifyChooseView : UIView

@property (nonatomic, strong)id<ClassifyChooseViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame sectionArray:(NSArray *)sectionArray itemArray:(NSArray *)itemArray;

@end
