//
//  MGCardView.h
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGCardView : UIView

@property (strong, nonatomic) NSString *picture;
@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
