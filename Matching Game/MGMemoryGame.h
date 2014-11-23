//
//  MGMemoryGame.h
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGCard.h"
#import "MGDeck.h"

@interface MGMemoryGame : NSObject

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(MGDeck *) deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (MGCard *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) int score;

@end
