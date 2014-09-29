//
//  ToDoItem.m
//  FoodTodo
//
//  Created by Yurim Jin on 2014. 8. 26..
//  Copyright (c) 2014년 Yurim Jin. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem
-(id)initWithText:(NSString *)text {
    if(self = [super init]) {
        self.text = text;
    }
    return self;
}

+(id)toDoItemWithText:(NSString *)text {
    return [[ToDoItem alloc] initWithText:text];
}
@end
