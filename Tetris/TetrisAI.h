//
//  TetrisAI.h
//  Tetris
//
//  Created by Thomas Ballinger on 4/21/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TetrisState.h"

@interface TetrisAI : NSObject
-(NSArray *) getAllPiecePlacements:(TetrisState*)state;
@end
