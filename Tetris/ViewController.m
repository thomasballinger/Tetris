//
//  ViewController.m
//  Tetris
//
//  Created by Thomas Ballinger on 4/2/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *blockDisplay;
@property (strong, nonatomic) TetrisState *game;
@property (nonatomic) int score;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController
- (void) setScore:(int)score{
    self.scoreLabel.text = [NSString stringWithFormat: @"%d", self.score];
    _score = score;
}
- (IBAction)moveLeft:(id)sender{
    [self.game movePieceLeft];
    [self displayFromArray:[self.game displayArray]];
    self.score = self.game.score;
}
- (IBAction)moveDown:(id)sender {
    [self.game movePieceDown];
    [self displayFromArray:[self.game displayArray]];
    self.score = self.game.score;
}
- (IBAction)moveRight:(id)sender {
    [self.game movePieceRight];
    [self displayFromArray:[self.game displayArray]];
}
- (IBAction)rotateLeft:(id)sender {
    [self.game rotatePiece];
    [self displayFromArray:[self.game displayArray]];
}

- (void) viewDidAppear: (BOOL) something
{
    [self orderBlockDisplay];
    self.game = [[TetrisState alloc] initWithHeight:7 andWidth:6];
    [self displayFromArray:[self.game displayArray]];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void) tick
{
    [self moveDown:@""];
}

- (void) orderBlockDisplay
{
    self.blockDisplay = [self.blockDisplay sortedArrayUsingComparator: ^NSComparisonResult(id a, id b) {
        UILabel *label1 = ( UILabel* ) a;
        UILabel *label2 = ( UILabel* ) b;
        if (label1.frame.origin.y == label2.frame.origin.y){
            if (label1.frame.origin.x == label1.frame.origin.y){
                return NSOrderedSame;
            }
            return label1.frame.origin.x > label2.frame.origin.x ? NSOrderedDescending : NSOrderedAscending;
            }
        return label1.frame.origin.y > label2.frame.origin.y ? NSOrderedDescending : NSOrderedAscending;
    }];
    int i = 1;
    for (UILabel* label in self.blockDisplay){
        label.text = [NSString stringWithFormat:@"%d", i];
        i++;
    }
}
- (void) displayFromArray: (NSArray*) array
{
    for (int i = 0; i < [array count]; i++){
        UILabel *l = (UILabel*) self.blockDisplay[i];
        l.text = array[i];
    }
    self.score = self.game.score;
}


@end
