//
//  TetrisState.m
//  Tetris
//
//  Created by Thomas Ballinger on 4/3/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import "TetrisState.h"

@implementation TetrisState{
}
-(id) initWithHeight: (int) height andWidth: (int) width{
    self = [super init];
    self.field = [[debrisField alloc] initWithBordersAndHeight:height andWidth:width];
    self.height = height;
    self.width = width;
    self.score = 0;
    self.current_piece = [[TetronimoI alloc] initWithX:3 andY:2];
    return self;
}
-(void) movePieceLeft{
    self.current_piece.origin.x--;
    if ([self.field pieceWillOverlap:self.current_piece]){
        self.current_piece.origin.x++;
    }
}
-(void) movePieceRight{
    self.current_piece.origin.x++;
    if ([self.field pieceWillOverlap:self.current_piece]){
        self.current_piece.origin.x--;
    }
}
-(void) movePieceDown{
    self.current_piece.origin.y++;
    if ([self.field pieceWillOverlap:self.current_piece]){
        self.current_piece.origin.y--;
        [self.field backgroundPiece:self.current_piece];
        int cleared = [self.field clearCompletedLines];
        self.score += cleared * cleared;
        [self newPiece];
    }
}
-(void) newPiece{
    self.current_piece = [[TetronimoI alloc] initWithX:3 andY:2];
    if ([self.field pieceWillOverlap:self.current_piece]){
        [self restart];
    }
}
-(void) rotatePieceLeft{
    [self.current_piece rotateLeft];
    if ([self.field pieceWillOverlap:self.current_piece]){
        [self.current_piece rotateRight];
    }
}
-(void) rotatePieceRight{}
-(NSArray *) displayArray{ //TODO put all this in debrisField
    NSMutableArray *output = [[NSMutableArray alloc] init];
    for (int row = 1; row < self.height+1; row++){
        for (int column = 1; column < self.width+1; column++){
            [output addObject:[self.field getTextureAtRow:row AndColumn:column]];
            for (Pos* spot in [self.current_piece getTranslatedSpots]){
                if (spot.row == row && spot.column == column){
                    [output removeObjectAtIndex:[output count]-1];
                    [output addObject:self.current_piece.texture];
                }
            }
        }
    }
    return output;
}
-(void) tick{}
-(void) restart{
    [self initWithHeight:self.height andWidth:self.width];
} @end
