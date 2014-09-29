//
//  ViewController.h
//  FoodTodo
//
//  Created by Yurim Jin on 2014. 8. 26..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellDelegate.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, TableViewCellDelegate> //데이터소스 프로토콜 추가, 델리게이트 설정
//UITableViewDataSource는 tableView:numberOfRowsInSection:이랑 tableView:cellForRowAtIndexPath를 implement해야함.
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
