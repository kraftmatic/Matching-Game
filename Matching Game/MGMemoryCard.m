//
//  MGMemoryCard.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGMemoryCard.h"

@implementation MGMemoryCard
@synthesize picture = _picture;

+ (NSArray *)validPictures{
    int numberOfCards = [[NSUserDefaults standardUserDefaults] integerForKey:@"numberOfCards"];
    if (numberOfCards == 4) {
        return @[@"dog",
                 @"dog",
                 @"cat",
                 @"cat",
                 ];
    } else if (numberOfCards == 16){
        return @[@"dog",
                 @"dog",
                 @"cat",
                 @"cat",
                 @"chicken",
                 @"chicken",
                 @"cow",
                 @"cow",
                 @"pig",
                 @"pig",
                 @"llama",
                 @"llama",
                 @"rooster",
                 @"rooster",
                 @"sheep",
                 @"sheep"
                 ];
    } else if (numberOfCards == 36){
        return @[@"dog",
                 @"dog",
                 @"cat",
                 @"cat",
                 @"chicken",
                 @"chicken",
                 @"cow",
                 @"cow",
                 @"pig",
                 @"pig",
                 @"llama",
                 @"llama",
                 @"rooster",
                 @"rooster",
                 @"sheep",
                 @"sheep",
                 @"tractor",
                 @"tractor",
                 @"barn",
                 @"barn",
                 @"carrot",
                 @"carrot",
                 @"corn",
                 @"corn",
                 @"farmer",
                 @"farmer",
                 @"haybale",
                 @"haybale",
                 @"horse",
                 @"horse",
                 @"silo",
                 @"silo",
                 @"sunflower",
                 @"sunflower",
                 @"wheat",
                 @"wheat"
                 ];
    }
    return nil;
}

- (NSString *)picture
{
    return _picture ? _picture : @"?";
}

@end
