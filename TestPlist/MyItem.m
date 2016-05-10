//
//  MyItem.m
//  TestPlist
//
//  Created by dean on 2016/5/10.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "MyItem.h"

@interface MyItem ()<NSCoding>

@end
@implementation MyItem

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.stringA forKey:@"A"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.stringA = [aDecoder decodeObjectForKey:@"A"];
    }
    return self;
}

@end
