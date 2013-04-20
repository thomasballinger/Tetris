//
//  ScoreStore.m
//  Tetris
//
//  Created by Thomas Ballinger on 4/10/13.
//  Copyright (c) 2013 Thomas Ballinger. All rights reserved.
//

#import "ScoreStore.h"
#define kBgQueue dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
@implementation ScoreStore {}

-(void) save_score:(NSInteger) score{
    NSLog(@"This will save score of %d", score);
}
-get_name{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Name" message:@"Enter your name for gloating purposes:" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
    UITextField *passwordTextField = [alertView textFieldAtIndex:0];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}
@end
