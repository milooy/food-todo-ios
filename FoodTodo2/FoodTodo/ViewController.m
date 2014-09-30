//
//  ViewController.m
//  FoodTodo
//
//  Created by Yurim Jin on 2014. 8. 26..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ViewController.h"
#import "ToDoItem.h"
#import "TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *_toDoItems; //인스턴스 변수 추가
    NSArray *images;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark - UITableViewDataSource의 필수 메서드들
-(NSInteger)tableView:(UITableView  *)tableView numberOfRowsInSection:(NSInteger)section {
    return _toDoItems.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *ident = @"cell";
    //셀재사용 코드 이거 원래 UIT..였는데 TableViewCell로 바꿈!
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident forIndexPath:indexPath];
    //이 인덱스의 투두아이템 찾기
    int index = [indexPath row];
    ToDoItem *item = _toDoItems[index];
    //텍스트 집어넣기
//    cell.textLabel.text = item.text;
    
    
    cell.delegate = self;
    cell.todoItem = item;
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _point.text = @"0";
    /*
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(saveText:) name:@"saveTextFieldText"object:nil];
     */
 
    _toDoItems = [[NSMutableArray alloc] init];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"iOS 공부하기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"공차 사먹기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"타블렛 사기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"김정교수님 찾아가기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"외주받아서 돈벌기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"고대생막창 먹기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"JWP 공부하기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"영화보기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"아이폰 사기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"앱 만들기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"캐릭터 그리기"]];
    [_toDoItems addObject:[ToDoItem toDoItemWithText:@"타블렛으로 그리기"]];
    
	self.tableView.dataSource = self; //데이터소스 등록
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"]; //UITableViewCell 클래스를 테이블뷰에 공급하는걸로 만듦
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"]; //TableViewCell 클래스를 테이블뷰에 공급하는걸로 만듦
    
    //델리게이트 설정
    self.tableView.delegate = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:237/255.0 green:107/255.0 blue:90/255.0 alpha:1.0];
    
    
    //투두몬
    
    images = [NSArray arrayWithObjects:[UIImage imageNamed:@"todomon0-1.png"], [UIImage imageNamed:@"todomon0-2.png"], nil];
    _todomon.animationImages = images;
    _todomon.animationDuration = 1;
    [_todomon startAnimating];
//    [_todomon stopAnimating];

}
-(void)saveText:(NSNotification *)note{
    NSString *text = [[note userInfo] objectForKey:@"inputText"];
    NSLog(@"name: %@", text);
}


//단계별 색상 설정
-(UIColor*)colorForIndex:(NSInteger) index {
    NSUInteger itemCount = _toDoItems.count -1;
    float val = ((float)index / (float)itemCount) * 0.9;
    return [UIColor colorWithRed:255/255.0 green:201/255.0 blue:val alpha:1.0];
}

#pragma mark - UITableViewDataDelegate프로토콜 메서드들
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

-(void)tableView: (UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [self colorForIndex:indexPath.row];
    /*
    ToDoItem *item = _toDoItems[indexPath.row];
    if (item.completed) {
        cell.backgroundColor = [UIColor greenColor];
    }
     */


}

-(void)toDoItemDeleted:(ToDoItem *)todoItem {
    [_todomon stopAnimating];
    _todomon.image = [UIImage imageNamed:@"todomon0-5.png"];
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self reStartAnimation];
    });

    NSUInteger index = [_toDoItems indexOfObject:todoItem];
    [self.tableView beginUpdates];
    [_toDoItems removeObject:todoItem];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    
}

-(void)reStartAnimation{
    [_todomon startAnimating];
}



-(void)toDoItemCompleted:(ToDoItem *)todoItem {
    /*
    
    NSUInteger index = [_toDoItems indexOfObject:todoItem];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath1];
    NSAttributedString *theAttributedString = [[NSAttributedString alloc]initWithString:cell.textLabel.text attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
     
    [cell.textLabel setAttributedText:theAttributedString];
     */
//    CGRect initialFrame = _doughnut.frame;
//    CGRect displacedFrame = initialFrame;
//    displacedFrame.origin.y += 500;
//    [UIView animateWithDuration:0.8 animations:^{
//        _doughnut.frame = initialFrame;
//    }];
    
    
    
    [UIView animateWithDuration:1 animations:^(void){
        [_doughnut setFrame:CGRectMake(_doughnut.frame.origin.x, _doughnut.frame.origin.y+100, 40, 40)];
//        _doughnut.frame = CGRectMake(0, 0, 40, 40);
    } completion:^(BOOL finished){
        
        NSLog(@"haha");
    }];
    
    
    /*
    [UIView beginAnimations:nil context:NULL]; // animate the following:
    _doughnut.frame = CGRectMake(500, 500, 100, 100); // move to new location

    [UIView setAnimationDuration:0.3];
    [UIView commitAnimations];
    */
    
    /*
    [UIView animateWithDuration:1.0 animations:^(void) {
        _doughnut.frame = CGRectMake(80, 80, 80, 50);
    } completion:^(BOOL finished) {
        NSLog(@"complete");
    }];
     */
    
    int pointPlus = [_point.text intValue]+1;
    _point.text = [NSString stringWithFormat:@"%d", pointPlus];
    [_todomon stopAnimating];
    NSArray *images2 = [NSArray arrayWithObjects:[UIImage imageNamed:@"todomon0-3.png"], [UIImage imageNamed:@"todomon0-4.png"], nil];
    _todomon.animationImages = images2;
    _todomon.animationDuration = 0.3;
    [_todomon startAnimating];
    double delayInSeconds = 0.8;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_todomon stopAnimating];
        _todomon.animationImages = images;
        _todomon.animationDuration = 1;
        [self reStartAnimation];
    });
    
}

-(void) toDoItemCompleting:(ToDoItem *)todoItem transparency:(NSInteger)transparency {
    NSLog(@"kakak");
}
 
 



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
