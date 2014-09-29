//
//  TableView.h
//  FoodTodo
//
//  Created by Yurim Jin on 2014. 9. 28..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewDataSource.h"

@interface TableView : UIView

@property(nonatomic, assign) id<TableViewDataSource> dataSource;

@end
