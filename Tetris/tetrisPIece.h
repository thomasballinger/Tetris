//
//  tetrisPIece.h
//  Tetris
//
//  Created by Thomas Ballinger on 4/3/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import <Foundation/Foundation.h>

// slower than a struct, but I'm practicing obj-c classes
// and there's no way the speed should matter

@interface Pos : NSObject {
}
@property (nonatomic) int x;
@property (nonatomic) int y;
- (id) initWithX: (int) x andY: (int) y;
- (int) row;
- (int) column;
@end

@interface RotationState : NSObject{}
@property (nonatomic, strong) NSArray *onLeft;
@property (nonatomic, strong) NSArray *onRight;
@property (nonatomic, strong) NSArray *spots;
- (id) initWithPositions: (NSArray*) positions;
@end

@interface TetrisPiece : NSObject {}
@property (nonatomic, strong) Pos *origin;
@property (nonatomic, strong) NSString *texture;
@property (nonatomic) int current_rotation;
@property (nonatomic, strong) NSArray *rotations;
- (NSArray*) getTranslatedSpots;
- (id) initWithX: (int) x andY: (int) y;
- (NSArray*) getSpotsWithTranslationX: (int) x andY: (int) y;
- (void) movePieceByX: (int) x andY: (int) y;
- (void) rotateRight;
@end

@interface TetronimoI : TetrisPiece{}
@end
@interface TetronimoJ : TetrisPiece{}
@end
@interface TetronimoL : TetrisPiece{}
@end
@interface TetronimoO : TetrisPiece{}
@end
@interface TetronimoS : TetrisPiece{}
@end
@interface TetronimoT : TetrisPiece{}
@end
@interface TetronimoZ : TetrisPiece{}
@end