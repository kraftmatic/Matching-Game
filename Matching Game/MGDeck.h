//
//  MGDeck.h
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MGCard.h"

@interface MGDeck : NSObject

- (void)addCard:(MGCard *)card atTop:(BOOL)atTop;
- (MGCard *)drawCard;

@end
