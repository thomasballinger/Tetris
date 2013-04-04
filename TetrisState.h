//
//  TetrisState.h
//  Tetris
//
//  Created by Thomas Ballinger on 4/3/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "debrisField.h"
#import "tetrisPIece.h"

@interface TetrisState : NSObject {}
@property (nonatomic, strong) debrisField *field;
@property (nonatomic, strong) TetrisPiece *current_piece;
@property (nonatomic) int height;
@property (nonatomic) int width;
@property (nonatomic) int score;
-(id) initWithHeight: (int) height andWidth: (int) width;
-(void) movePieceLeft;
-(void) movePieceRight;
-(void) movePieceDown;
-(void) rotatePieceLeft;
-(void) rotatePieceRight;
-(NSArray*) displayArray;
-(void) tick;
-(void) restart;
@end
