//
//  TetrisView.m
//  programaticDemo
//
//  Created by Thomas Ballinger on 4/21/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import "TetrisView.h"

@interface TetrisView ()
@property (nonatomic, strong) NSMutableArray *cells;
@property (nonatomic, strong) NSDictionary *colorCode;
@property (nonatomic) int width;
@property (nonatomic) int height;
@end

@implementation TetrisView

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame andBoardRows:10 andColumns:8];
}

- (id)initWithFrame:(CGRect)frame andBoardRows: (int)height andColumns: (int)width{
    self = [super initWithFrame:frame];
    if (self) {
        self.cells = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor magentaColor];
        self.height = height;
        self.width = width;
        float cellWidth = frame.size.width / self.width;
        float cellHeight = frame.size.height / self.height;
        for (int i = 0; i < self.height; i++){
            for (int j = 0; j < self.width; j++){
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(j*cellWidth, i*cellHeight, cellWidth+1.0f, cellHeight+1.0f)];
                // Lines appear in simulator between cells without the +1.0f;
                // I don't understand why, and haven't tested on a device
                [label setBackgroundColor:[UIColor blueColor]];
                [self.cells addObject:label];
                [self addSubview:label];
            }
        }
        
        self.colorCode = @{
                           @"I": [UIColor redColor],
                           @"J": [UIColor blueColor],
                           @"L": [UIColor purpleColor],
                           @"O": [UIColor darkGrayColor],
                           @"S": [UIColor cyanColor],
                           @"Z": [UIColor yellowColor],
                           @"T": [UIColor orangeColor],
                           @"-": [UIColor whiteColor],
                           };
    }
    return self;
}

- (void) displayArray: (NSArray *) values {
    NSAssert([values count] == [self.cells count], @"displayArray arg is of wrong size");
    for (int i = 0; i < self.height; i++){
        for (int j = 0; j < self.width; j++){
            UIView *cell = self.cells[i*self.width + j];
            cell.backgroundColor = self.colorCode[values[i*self.width + j]];
        }
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
