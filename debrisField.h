//
//  debrisField.h
//  Tetris
//
//  Created by Thomas Ballinger on 4/3/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "tetrisPiece.h"

@interface debrisField : NSObject <NSCopying>{
}
@property (nonatomic, strong) NSMutableArray *field;
- (NSArray *)getCompletedLines;
- (int)clearCompletedLines;
- (BOOL)pieceWillOverlap:(TetrisPiece*)piece;
- (NSString *)getTextureAtRow:(int)row AndColumn:(int)col;
- (void)backgroundPiece:(TetrisPiece*)piece;
- (void)unbackgroundPiece:(TetrisPiece*)piece;
- (id)initWithHeight:(int)height andWidth:(int)width;
@end