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
@property (nonatomic) int highScore;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;
@end

@implementation ViewController
- (void) setScore:(int)score{
    self.scoreLabel.text = [NSString stringWithFormat: @"score: %d", self.score];
    _score = score;
    if (score > self.highScore){
        self.highScore = score;
    }
}
- (void) setHighScore:(int)highScore{
    _highScore = highScore;
    self.highScoreLabel.text = [NSString stringWithFormat: @"high: %d", self.highScore];
}
- (IBAction)swipe:(id)sender {
    NSLog(@"%@", sender);
    
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
    self.game = [[TetrisState alloc] initWithHeight:10 andWidth:8];
    [self displayFromArray:[self.game displayArray]];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    self.highScore = 0;
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
- (void) viewDidLoad{
    [super viewDidLoad];
    [self addGestureRecognizers];
}
- (void) addGestureRecognizers{
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:swipeLeft];

    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(moveDown:)];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer:swipeDown];
}
@end
