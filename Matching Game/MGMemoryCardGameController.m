//
//  MGMemoryCardGameController.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGMemoryCardGameController.h"
#import "MGMemoryDeck.h"
#import "MGMemoryCardCollectionViewCell.h"
#import "MGCardView.h"
#import "MGMemoryCard.h"


@implementation MGMemoryCardGameController

- (MGDeck *)createDeck
{
    return [MGMemoryDeck new];
}

- (NSUInteger) startingCardCount
{
    return 4;
}

- (void) updateCell:(UICollectionViewCell *)cell usingCard:(MGCard *)card animate:(BOOL)animate
{
    if ([cell isKindOfClass:[MGMemoryCardCollectionViewCell class]]) {
        MGCardView *memoryCardView = ((MGMemoryCardCollectionViewCell *)cell).cardView;
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
