//
//  tetrisPIece.m
//  Tetris
//
//  Created by Thomas Ballinger on 4/3/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//
#define POS(x, y) [[Pos alloc] initWithX: x andY: y]
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
    self.current_rotation = 0;
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
- (NSArray *)spots{
    return self.rotations[self.current_rotation];
}
- (void) rotateRight{
    self.current_rotation = (self.current_rotation + 1) % self.rotations.count;
}
@end

@implementation RotationState
- (id) initWithPositions: (NSArray *) positions{
    self = [super init];
    self.spots = positions;
    return self;
}
@end

@implementation TetronimoO
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.rotations = @[@[POS(0, 0), POS(1, 0), POS(0, 1), POS(1, 1)]];
    self.texture = @"O";
    return self;
}
@end
@implementation TetronimoI
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.rotations = @[@[POS(0, 2), POS(1, 2), POS(2, 2), POS(3, 2)],
                       @[POS(1, 0), POS(1, 1), POS(1, 2), POS(1, 3)]];
    self.texture = @"I";
    return self;
}
@end
@implementation TetronimoJ
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.rotations = @[@[POS(2, 2), POS(2, 1), POS(1, 1), POS(0, 1)],
                       @[POS(0, 2), POS(1, 2), POS(1, 1), POS(1, 0)],
                       @[POS(0, 0), POS(0, 1), POS(1, 1), POS(2, 1)],
                       @[POS(2, 0), POS(1, 0), POS(1, 1), POS(1, 2)]];
    self.texture = @"J";
    return self;
}
@end
@implementation TetronimoL
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.rotations = @[@[POS(0, 2), POS(0, 1), POS(1, 1), POS(2, 1)],
                       @[POS(0, 0), POS(1, 0), POS(1, 1), POS(1, 2)],
                       @[POS(2, 0), POS(2, 1), POS(1, 1), POS(0, 1)],
                       @[POS(2, 2), POS(1, 2), POS(1, 1), POS(1, 0)]];
    self.texture = @"L";
    return self;
}
@end
@implementation TetronimoS
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.rotations = @[@[POS(0, 2), POS(1, 2), POS(1, 1), POS(2, 1)],
                       @[POS(1, 2), POS(0, 1), POS(1, 1), POS(0, 0)]];
    self.texture = @"S";
    return self;
}
@end
@implementation TetronimoZ
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.rotations = @[@[POS(0, 1), POS(1, 1), POS(1, 2), POS(2, 2)],
                       @[POS(0, 2), POS(0, 1), POS(1, 1), POS(1, 0)]];
    self.texture = @"Z";
    return self;
}
@end
@implementation TetronimoT
- (id) initWithX:(int)x andY:(int)y {
    self = [super initWithX:x andY:y];
    self.rotations = @[@[POS(0, 1), POS(1, 1), POS(1, 2), POS(2, 1)],
                       @[POS(1, 2), POS(1, 1), POS(2, 1), POS(1, 0)],
                       @[POS(0, 1), POS(1, 1), POS(1, 0), POS(2, 1)],
                       @[POS(1, 0), POS(1, 1), POS(0, 1), POS(1, 2)]];
    self.texture = @"T";
    return self;
}
@end
