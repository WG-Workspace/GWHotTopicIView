//
//  GWHotTopicView.h
//  GWHotTopicsView
//
//  Created by Ordinary on 16/3/25.
//  Copyright © 2016年 Ordinary. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GWHotTopicView;
// 点击代理方法
@protocol  GWHotTopicViewDelegate <NSObject>

@required
- (void)hotTopicView:(GWHotTopicView *)topicView andClickedTopicButton:(UIButton *)btn;


@end

@interface GWHotTopicView : UIView

// 类方法
+ (instancetype)hotTopicViewWithFrame:(CGRect)frame andHotTopics:(NSArray<NSString *>*) topics;
// 对象方法
- (instancetype)initWithFrame:(CGRect)frame andHotTopics:(NSArray <NSString *>*)topics;

// 代理属性
@property (nonatomic, weak)  id<GWHotTopicViewDelegate> delegate;

@end