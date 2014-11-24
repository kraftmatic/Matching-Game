//
//  MGLargeCardGameController.h
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/23/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGCard.h"
#import "MGDeck.h"

@interface MGLargeCardGameController : UIViewController

@property (nonatomic) NSUInteger startingCardCount;

- (MGDeck *)createDeck;
- (void) updateCell:(UICollectionViewCell *)cell usingCard:(MGCard *)card animate:(BOOL)animate;

@end
