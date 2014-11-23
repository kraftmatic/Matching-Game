//
//  MGMemoryCardCollectionViewCell.h
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/23/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGCardView.h"

@interface MGMemoryCardCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet MGCardView *cardView;

@end
