//
//  MGCardGameController.h
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGCard.h"
#import "MGDeck.h"

@interface MGCardGameController : UIViewController

@property (nonatomic) NSUInteger startingCardCount; //abstract

- (MGDeck *)createDeck;
- (void) updateCell:(UICollectionViewCell *)cell usingCard:(MGCard *)card animate:(BOOL)animate;

@end
