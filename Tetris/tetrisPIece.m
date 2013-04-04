//
//  tetrisPIece.m
//  Tetris
//
//  Created by Thomas Ballinger on 4/3/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import "tetrisPiece.h" 

@implementation Pos
- (id) initWithX: (int) x andY: (int) y{
    self = [super init];
    self.x = x;
    self.y = y;
    return self;
}
- (id) init{
    return [self initWithX: 0 andY: 0];
}
- (int) row { return _y; }
- (int) column { return _x; }
- (void) setRow: (int) row { _y = row; }
- (void) setColumn: (int) col { _x = col; }
- (NSString*) description {
    return [[NSString alloc] initWithFormat: @"{%d, %d}", self.x, self.y];
}
@end

@implementation TetrisPiece : NSObject {
}
- (id) init {
    return [self initWithX:0 andY:0];
    return self;
}
- (id) initWithX:(int)x andY:(int)y{
    self = [super init];
    self.origin = [[Pos alloc] initWithX:x andY:y];
    return self;
}
- (NSArray*) getTranslatedSpots{
    NSMutableArray *a = [[NSMutableArray alloc] init];
    for (Pos *spot in self.spots){
        [a addObject: [[Pos alloc] initWithX:spot.x + self.origin.x andY:spot.y + self.origin.y]];
    }
    return [[NSArray alloc] initWithArray:a];
}
- (NSArray*) getSpotsWithTranslationX:(int)x andY:(int)y{
    NSMutableArray *a = [[NSMutableArray alloc] init];
    for (Pos *spot in self.spots){
        spot.x = spot.x + x;
        spot.y = spot.y + y;
        [a addObject: [[Pos alloc] initWithX:spot.x + self.origin.x andY:spot.y + self.origin.y]];
    }
    return [[NSArray alloc] initWithArray:a];
}
- (void) movePieceByX:(int)x andY:(int)y{
    self.origin.x = self.origin.x + x;
    self.origin.y = self.origin.y + y;
}
@end

@implementation TetronimoO
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.spots = @[
        [[Pos alloc] initWithX: 0 andY: 0],
        [[Pos alloc] initWithX: 1 andY: 0],
        [[Pos alloc] initWithX: 0 andY: 1],
        [[Pos alloc] initWithX: 1 andY: 1]];
    self.texture = @"O";
    return self;
}
@end
@implementation TetronimoI
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.spots = @[
        [[Pos alloc] initWithX: 0 andY: 0],
        [[Pos alloc] initWithX: 0 andY: 1],
        [[Pos alloc] initWithX: 0 andY: 2],
        [[Pos alloc] initWithX: 0 andY: 3]];
    self.texture = @"I";
    return self;
}



@end