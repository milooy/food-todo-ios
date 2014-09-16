//
//  TableViewCell.m
//  FoodTodo
//
//  Created by Yurim Jin on 2014. 8. 27..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell {
    CGPoint _originalCenter;
    BOOL _deleteOnDragRelease;
    BOOL _markCompleteOnDragRelease;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //모든 pan events는 handlePan으로 전달된다.
        UIGestureRecognizer* recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        recognizer.delegate = self;
        [self addGestureRecognizer:recognizer];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 펜제스쳐
-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:[self superview]];
    //가로 제스쳐 판별
    if(fabsf(translation.x) > fabsf(translation.y)) {
        return YES;
    }
    return NO;
}

//손가락 위치 판별
-(void)handlePan:(UIPanGestureRecognizer *)recognizer {
    //1 방금시작한 제스쳐의 현재 중점을 originalCenter에 기록
    if(recognizer.state == UIGestureRecognizerStateBegan) {
        _originalCenter = self.center;
    }
    
    //2 움직인 x가 셀너비/2보다 크면 지우는거다.
    if(recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:self];
        self.center = CGPointMake(_originalCenter.x + translation.x, _originalCenter.y);
        _deleteOnDragRelease = self.frame.origin.x < -self.frame.size.width/2;
        _markCompleteOnDragRelease = self.frame.origin.x > self.frame.size.width / 2;
    }
    
    //3
    if(recognizer.state == UIGestureRecognizerStateEnded) {
        CGRect originalFrame = CGRectMake(0, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
        //반절까지 안차지면 다시 원자리로 돌아감
        if(!_deleteOnDragRelease) {
            [UIView animateWithDuration:0.2 animations:^{self.frame = originalFrame;}];
        }
        
        //delegate에게 "이 아이템 지워져야한다!"메세지 보내기
        if(_deleteOnDragRelease) {
            [self.delegate toDoItemDeleted:self.todoItem];
        }
        
        if (_markCompleteOnDragRelease) {
            // mark the item as complete and update the UI state
            self.todoItem.completed = YES;
            [self.delegate toDoItemCompleted:self.todoItem];
            NSLog(@"completed");
        }
    }

}

@end
