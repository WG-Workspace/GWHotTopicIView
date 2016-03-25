//
//  ViewController.m
//  GWHotTopicsView
//
//  Created by Ordinary on 16/3/25.
//  Copyright © 2016年 Ordinary. All rights reserved.
//

#import "ViewController.h"
#import "GWHotTopicView.h"

@interface ViewController ()<GWHotTopicViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tempTopics = @[@"医德高尚",@"非常耐心",@"回复非常及时、满意",@"意见很有帮助",@"非常认真敬业",@"非常清楚",@"回复非常及时、满意",@"由衷的感谢您老师",@"非常专业",@"德医双好"];
    
    GWHotTopicView *hotTopicView = [GWHotTopicView hotTopicViewWithFrame:self.view.frame andHotTopics:tempTopics];
    
    [self.view addSubview:hotTopicView];
    
    hotTopicView.delegate = self;
}


- (void)hotTopicView:(GWHotTopicView *)topicView andClickedTopicButton:(UIButton *)btn {

    NSLog(@"%@--tag:%ld",btn.titleLabel.text,btn.tag);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
