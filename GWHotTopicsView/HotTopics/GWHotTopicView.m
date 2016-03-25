//
//  GWHotTopicView.m
//  GWHotTopicsView
//
//  Created by Ordinary on 16/3/25.
//  Copyright © 2016年 Ordinary. All rights reserved.
//

#import "GWHotTopicView.h"

// 屏幕宽度
#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface GWHotTopicView ()

@property (nonatomic, assign) int width;
@property (nonatomic, assign) int rowCount;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) CGFloat rowWidth;


@property (nonatomic, strong) NSArray <NSString *>*tempArray;

@end

@implementation GWHotTopicView

// 类方法
+ (instancetype)hotTopicViewWithFrame:(CGRect)frame andHotTopics:(NSArray<NSString *> *)topics{

    return [[self alloc]initWithFrame:frame andHotTopics:topics];
}

// 对象方法
- (instancetype)initWithFrame:(CGRect)frame andHotTopics:(NSArray<NSString *> *)topics {
    
    NSArray *tempTopics = topics;
    if (tempTopics == nil) {
        tempTopics = @[@"医德高尚",@"非常耐心",@"回复非常及时、满意",@"意见很有帮助",@"非常认真敬业",@"非常清楚",@"回复非常及时、满意",@"由衷的感谢您老师",@"非常专业",@"德医双好"];
    }
    
    
    if (self = [super initWithFrame:frame]) {
        
        // 更新UI;
        [self updteUIWithTopicArray:tempTopics];
    }
    
    return self;
}

- (void)updteUIWithTopicArray:(NSArray<NSString *> *) topics {
    
    for (int i=0; i< topics.count ; i++) {
        UIButton *topicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        topicBtn.tag = 300 +i;
        [topicBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        // 计算size
        CGSize titleSize = [topics[i] boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
        
        titleSize.width += 5;
        
        _rowWidth = _rowWidth + titleSize.width + 10;
        if (_rowWidth > kSCREEN_WIDTH ) {
            _rowWidth = 0;
            _rowWidth = _rowWidth + titleSize.width;
            
            _width = 0;
            _width = _width + titleSize.width;
            
            _rowCount ++;
            
            _count = 0;
            
            topicBtn.frame = CGRectMake(10, 64 + 50 * _rowCount, titleSize.width, 40);
            
        }else {
        
            topicBtn.frame = CGRectMake(_width + 10 + (_count * 10 ), 64 + 50*_rowCount, titleSize.width, 40);
            _width = _width + titleSize.width;
        
        }
        
        _count ++;
        
        topicBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        topicBtn.layer.masksToBounds = YES;
        topicBtn.layer.cornerRadius = 10;
        topicBtn.backgroundColor = [UIColor lightGrayColor];

        topicBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [topicBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [topicBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [topicBtn setTitle:topics[i] forState:UIControlStateNormal];
        
        [self addSubview:topicBtn];
        
        
        // 注册点击事件
        [topicBtn addTarget:self action:@selector(didClickTopicBtnEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    

}


- (void)didClickTopicBtnEvent:(UIButton *) sender {

    // 调用代理方法
    if ([self.delegate respondsToSelector:@selector(hotTopicView:andClickedTopicButton:)]) {
        
        [self.delegate hotTopicView:self andClickedTopicButton:sender];
    }

}



@end
