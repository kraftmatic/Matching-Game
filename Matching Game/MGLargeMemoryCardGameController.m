//
//  MGLargeMemoryCardGameController.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/23/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGLargeMemoryCardGameController.h"
#import "MGMemoryDeck.h"
#import "MGLargeMemoryCollectionViewCell.h"
#import "MGMemoryCard.h"

@interface MGLargeMemoryCardGameController ()

@end

@implementation MGLargeMemoryCardGameController

- (MGDeck *)createDeck
{
    return [MGMemoryDeck new];
}

- (NSUInteger) startingCardCount
{
    return 36;
}

- (void) updateCell:(UICollectionViewCell *)cell usingCard:(MGCard *)card animate:(BOOL)animate
{
    if ([cell isKindOfClass:[MGLargeMemoryCollectionViewCell class]]) {
        MGCardView *memoryCardView = ((MGLargeMemoryCollectionViewCell *)cell).cardView;
        if ([card isKindOfClass:[MGMemoryCard class]]) {
            MGMemoryCard *memoryCard = (MGMemoryCard *)card;
            memoryCardView.picture = memoryCard.picture;
            
            if (memoryCardView.faceUp != memoryCard.isUp) {
                [UIView transitionWithView:cell
                                  duration:0.5
                                   options:UIViewAnimationOptionTransitionFlipFromLeft
                                animations:^{
                                    
                                    memoryCardView.faceUp = memoryCard.isUp;
                                }
                                completion:NULL];
            }
            
            //playingCardView.faceUp = playingCard.isFaceUp;
            memoryCardView.alpha = memoryCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}

@end
