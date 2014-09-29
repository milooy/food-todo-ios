//
//  TableView.m
//  FoodTodo
//
//  Created by Yurim Jin on 2014. 9. 28..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "TableView.h"

@implementation TableView {
    UIScrollView *_scrollView;
}

const float ROW_HEIGHT = 50.0f;

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectNull];
        [self addSubview:_scrollView];
        _scrollView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)layoutSubviews {
    _scrollView.frame = self.frame;
    [self refreshView];
}

-(void)refreshView {
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, [_dataSource numberOfRows] *ROW_HEIGHT);
    
    for(int row=0; row<[_dataSource numberOfRows]; row++) {
        UIView *cell = [_dataSource cellForRow:row];
        
        float topEdgeForRow = row*ROW_HEIGHT;
        CGRect frame = CGRectMake(0, topEdgeForRow, _scrollView.frame.size.width, ROW_HEIGHT);
        cell.frame = frame;
        [_scrollView addSubview:cell];
    }
}

-(void)setDataSource:(id<TableViewDataSource>)dataSource {
    _dataSource = dataSource;
    [self refreshView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
