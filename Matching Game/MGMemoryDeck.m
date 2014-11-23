//
//  MGMemoryDeck.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGMemoryDeck.h"
#import "MGMemoryCard.h"

@implementation MGMemoryDeck

- (id)init
{
    self = [super init];
    if (self) {
        for (NSString *picture in [MGMemoryCard validPictures]) {
            
            MGMemoryCard *card = [MGMemoryCard new];
            card.picture = picture;
            [self addCard:card atTop:true];
        }
    }
    return self;
}

@end
