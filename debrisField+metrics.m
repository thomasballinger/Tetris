//
//  debrisField+metrics.m
//  Tetris
//
//  Created by Thomas Ballinger on 4/22/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import "debrisField+metrics.h"

@implementation debrisField (metrics)
-(int) totalBlocks{
    int sum = [[self.field indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return ![EMPTY isEqualToString:obj];
    }
              ] count];
    return sum;
}
@end
