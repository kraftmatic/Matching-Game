//
//  MGMemoryGame.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGMemoryGame.h"
#import "MGCard.h"
#import "MGDeck.h"

@interface MGMemoryGame()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation MGMemoryGame

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [NSMutableArray new];
    }
    
    return _cards;
}

- (id) initWithCardCount:(NSUInteger)count
               usingDeck:(MGDeck *) deck
{
    self = [super init];
    
    if (self) {
        
        for (int i = 0; i < count; i++) {
            MGCard *card = [deck drawCard];
            
            if (card) {
                self.cards[i] = card;
                
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (MGCard *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


- (void)flipCardAtIndex:(NSUInteger)index
{
    
    MGCard *card = [self cardAtIndex:index];
    if (card && !card.isUnplayable) {
        
        int cardsUp = 0;
        for (MGCard *otherCard in self.cards){
            if (otherCard.isUp && !otherCard.isUnplayable) {
                cardsUp++;
            }
        }
        if (cardsUp == 2) {
            for (MGCard *otherCard in self.cards) {
                if (!otherCard.isUnplayable) {
                    otherCard.isUp = NO;
                }
            }
        }
        
        if (!card.isUp) {
            for (MGCard *otherCard in self.cards) {
                if (otherCard.isUp && !otherCard.isUnplayable) {
                    int isMatched = [card match:@[otherCard]];
                    
                    if (isMatched) {
                        card.isUnplayable = YES;
                        otherCard.isUnplayable = YES;
                    }
                    break;
                }
            }
        }
        
        card.isUp = !card.isUp;
    }
}

@end

