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
}

-(id) init {
    self=[super init];
    if(self) {
        //클래스 메서드들 호출. alloc init안해도 됨.
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
    }
    NSLog(@"init: %@", _toDoItems);
    return self;
}

//toDoItems Array에 가짜데이터 addObject하기 이거 호출 안됨.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        //클래스 메서드들 호출. alloc init안해도 됨.
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
    }
    NSLog(@"nib: %@", _toDoItems);
    return self;
    
}
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark - UITableViewDataSource의 필수 메서드들
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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
    cell.textLabel.text = item.text;
    
    cell.delegate = self;
    cell.todoItem = item;
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    ViewController *viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //ViewController *viewController = [[ViewController alloc] init];


    
    //이거 어케 없애지
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
    NSLog(@"haha: %@", _toDoItems);
    
    //델리게이트 설정
    self.tableView.delegate = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithRed:237/255.0 green:107/255.0 blue:90/255.0 alpha:1.0];
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

}

-(void)toDoItemDeleted:(ToDoItem *)todoItem {
    
    NSUInteger index = [_toDoItems indexOfObject:todoItem];
    [self.tableView beginUpdates];
    [_toDoItems removeObject:todoItem];
    [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
    
}

-(void)toDoItemCompleted:(ToDoItem *)todoItem {
    NSUInteger index = [_toDoItems indexOfObject:todoItem];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:index inSection:0];
    //UITableviewCell* completedCell =
    //[UITableView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath1];
    cell.backgroundColor = [UIColor redColor];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
