//
//  Todo+CoreDataProperties.h
//  EveryDoAgain
//
//  Created by Javier Xing on 2017-11-22.
//  Copyright © 2017 Javier Xing. All rights reserved.
//
//

#import "Todo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Todo (CoreDataProperties)

+ (NSFetchRequest<Todo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *todoDescription;
@property (nonatomic) int16_t priority;
@property (nonatomic) BOOL completed;

@end

NS_ASSUME_NONNULL_END
