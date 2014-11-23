//
//  MGCard.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGCard.h"

@implementation MGCard

- (int) match:(NSArray *)otherCards{
    int score = 0;
    for (MGCard *card in otherCards) {
        if ([card.picture isEqualToString:self.picture]) {
            score = 1;
            break;
        }
    }
    return score;
}

@end
