//
//  debrisField.m
//  Tetris
//
//  Created by Thomas Ballinger on 4/3/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#define EDGE @"X"

#import "debrisField.h"

@interface debrisField ()
@property (nonatomic) int height;
@property (nonatomic) int width;
@end

@implementation debrisField {}
-(id) initWithHeight:(int)height andWidth:(int)width{
    self = [super init];
    self.height = height;
    self.width = width;
    self.field = [[NSMutableArray alloc] init];
    for (int i = 0; i<height*width; i++){
        [self.field addObject: @"-"];
    }
    return self;
}
-(void) setSpotX: (int) x andY: (int) y to: (id) value{
    NSAssert(x < self.width, @"x > width");
    NSAssert(x >= 0, @"x < 0");
    NSAssert(y < self.height, @"y > height");
    NSAssert(y >= 0, @"y < 0");
    self.field[x+y*self.width] = value;
}
-(NSString *) getTextureAtRow: (int) row AndColumn: (int) column{
    return [self getSpotX: column andY: row];
}
-(NSString *) getSpotRow: (int) row andColumn: (int) column{
    return [self getSpotX: column andY: row];
}
-(void) setSpotRow: (int) row andColumn: (int) column to: (id) value{
    [self setSpotX: column andY: row to: value];
}
-(NSString *) getSpotX: (int) x andY: (int) y{
    if (x < self.width && x >= 0 && y < self.height && y >= 0) {
        return self.field[x+y*self.width];
    } else {
        return EDGE;
    }
}
-(void) backgroundPiece:(TetrisPiece *)piece{
    for (Pos* p in [piece getTranslatedSpots]){
        [self setSpotX:p.x andY:p.y to:piece.texture];
    }
}
-(BOOL) pieceWillOverlap:(TetrisPiece *)piece{
    for (Pos* p in [piece getTranslatedSpots]){
        if (![@"-" isEqualToString: [self getSpotX:p.x andY:p.y]]){
            return YES;
        }
    }
    return NO;
}
-(int) clearCompletedLines{
    NSArray * filled = [self getCompletedLines];
    int row_to_move_to = self.height-1;
    for (int row_to_process = self.height-1; row_to_process >= 0; row_to_process--){
        if ([filled containsObject: @(row_to_process)]){
            for (int column = 0; column < self.width; column++){
                [self setSpotRow:row_to_process andColumn:column to:@"-"];
            }
        } else {
            for (int column = 0; column < self.width; column++){
                [self setSpotRow:row_to_move_to andColumn:column to:
                 [self getSpotRow:row_to_process andColumn:column]];
            }
            row_to_move_to--;
        }
    }
    return [filled count];
}
-(NSArray *) getCompletedLines{
    // assumes the active piece has already been backgrounded
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int row = 0; row < self.height; row++){
        [result addObject: [[NSNumber alloc] initWithInt:row]];
        for (int column = 0; column < self.width; column++){
            NSString *value = [self getSpotX:column andY:row];
            if ([value isEqualToString: @"-"]){
                [result removeLastObject];
                break;
            }
        }
    }
    return [[NSArray alloc] initWithArray:result];
}
@end