//
//  TetrisView.h
//  programaticDemo
//
//  Created by Thomas Ballinger on 4/21/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TetrisView : UIView
- (void) displayArray: (NSArray *) values;
- (id)initWithFrame:(CGRect)frame andBoardRows: (int)height andColumns: (int)width;
@end
