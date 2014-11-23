//
//  MGCard.h
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGCard : NSObject

@property (nonatomic, strong) NSString *picture;
@property (nonatomic, getter = isUp) BOOL isUp;
@property (nonatomic, getter = isUnplayable) BOOL isUnplayable;

- (int) match: (NSArray *) otherCards;

@end
