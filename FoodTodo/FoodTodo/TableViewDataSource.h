//
//  TableViewDataSource.h
//  FoodTodo
//
//  Created by Yurim Jin on 2014. 9. 28..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

//UITableViewDataSource랑 비슷한거 만들기.
#import <Foundation/Foundation.h>

@protocol TableViewDataSource <NSObject>

-(NSInteger)numberOfRows;
-(UIView *)cellForRow:(NSInteger)row;

@end
