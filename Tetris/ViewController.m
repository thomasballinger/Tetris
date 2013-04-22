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
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) TetrisView *tetrisView;
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
    [self.timer invalidate];
    [self.game movePieceDown];
    [self displayFromArray:[self.game displayArray]];
    self.score = self.game.score;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:NO];
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
    self.game = [[TetrisState alloc] initWithHeight:10 andWidth:8];
    [self displayFromArray:[self.game displayArray]];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:NO];
    self.highScore = 0;
}

- (void) tick
{
    [self moveDown:@""];
}

- (void) displayFromArray: (NSArray*) array
{
    [self.tetrisView displayArray:array];
    self.score = self.game.score;
}
- (void) viewDidLoad{
    [super viewDidLoad];
    [self addGestureRecognizers];
    [self addPrettyTetrisView];
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
- (void) addPrettyTetrisView{
    self.tetrisView = [[TetrisView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 300.0f, 400.0f) andBoardRows:10 andColumns:8];
    [self.view addSubview: self.tetrisView];
}
@end
