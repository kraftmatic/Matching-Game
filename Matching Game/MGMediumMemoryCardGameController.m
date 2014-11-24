//
//  MGMediumMemoryCardGameController.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/23/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGMediumMemoryCardGameController.h"
#import "MGMemoryDeck.h"
#import "MGMediumMemoryCardCollectionViewCell.h"
#import "MGCardView.h"
#import "MGMemoryCard.h"


@implementation MGMediumMemoryCardGameController

- (MGDeck *)createDeck
{
    return [MGMemoryDeck new];
}

- (NSUInteger) startingCardCount
{
    return 16;
}

- (void) updateCell:(UICollectionViewCell *)cell usingCard:(MGCard *)card animate:(BOOL)animate
{
    if ([cell isKindOfClass:[MGMediumMemoryCardCollectionViewCell class]]) {
        MGCardView *memoryCardView = ((MGMediumMemoryCardCollectionViewCell *)cell).cardView;
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
            
            if (memoryCard.isUnplayable){
                memoryCardView.alpha = 0.5;
            }
        }
    }
}

@end
