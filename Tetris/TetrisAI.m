//
//  TetrisAI.m
//  Tetris
//
//  Created by Thomas Ballinger on 4/21/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import "TetrisAI.h"

@implementation TetrisAI
-(NSArray *) getAllPiecePlacements:(TetrisState*)state{
    NSMutableArray *placements = [[NSMutableArray alloc] init];
    TetrisPiece *piece = [state.current_piece copy];
    for (int x = 0; x < state.width; x++) {
        piece.origin.x = x;
        for (int y = 0; y < state.height; y++) {
            piece.origin.y = y;
            for (int r = 0; r < [state.current_piece.rotations count]; r++){
                piece.current_rotation = r;
                debrisField *field = state.field;
                NSLog(@"trying pos %d, %d, rotation %d", x, y, r);
                if ([field pieceWillOverlap:piece]){
                    NSLog(@"invalidPiecePosition");
                    continue;
                }
                [piece movePieceByX:0 andY:1];
                if ([field pieceWillOverlap:piece]){
                    [piece movePieceByX:0 andY:-1];
                }else{
                    [piece movePieceByX:0 andY:-1];
                    continue;
                }
                [field backgroundPiece:piece];
                //TODO profile to figure out if this mutable state stuff
                // pays off or not - it's certainly more complicated
                // (moving pieces down then back up, and
                // only creating a new state copy if lines cleared)
                if ([[state.field getCompletedLines] count] > 0){
                    debrisField *origField = field;
                    field = [origField copy];
                    [origField unbackgroundPiece:piece];
                    [field clearCompletedLines];
                } else {
                    [field unbackgroundPiece:piece];
                }
                
                NSLog(@"Worth evaluating field!");
                
            }
        }
    }
    return [NSArray arrayWithArray: placements];
}
@end
