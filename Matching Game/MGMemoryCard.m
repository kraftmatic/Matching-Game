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
    return @[@"dog",
             @"dog",
             @"cat",
             @"cat"
             ];
}

- (NSString *)picture
{
    return _picture ? _picture : @"?";
}

@end
