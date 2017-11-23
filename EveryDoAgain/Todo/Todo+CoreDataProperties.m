//
//  Todo+CoreDataProperties.m
//  EveryDoAgain
//
//  Created by Javier Xing on 2017-11-22.
//  Copyright © 2017 Javier Xing. All rights reserved.
//
//

#import "Todo+CoreDataProperties.h"

@implementation Todo (CoreDataProperties)

+ (NSFetchRequest<Todo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Todo"];
}

@dynamic title;
@dynamic todoDescription;
@dynamic priority;
@dynamic completed;

@end
