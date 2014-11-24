//
//  MGLargeCardGameController.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/23/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGLargeCardGameController.h"
#import "MGMemoryGame.h"

@interface MGLargeCardGameController () <UICollectionViewDataSource>

@property (nonatomic, strong) MGMemoryGame *game;
@property (weak, nonatomic) IBOutlet UICollectionView *largeGameView;

@end

@implementation MGLargeCardGameController

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(MGCard *)card animate:(BOOL)animate{
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LargeMemoryCard" forIndexPath:indexPath];
    MGCard *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card animate:NO];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.startingCardCount;
}

-(MGDeck *)createDeck{
    return nil;
}

- (MGMemoryGame *) game
{
    if (!_game) {
        _game = [[MGMemoryGame alloc] initWithCardCount:[[NSUserDefaults standardUserDefaults] integerForKey:@"numberOfCards"] usingDeck:[self createDeck]];
    }
    
    return _game;
}

- (void) updateUI
{
    for (UICollectionViewCell *cell in [self.largeGameView visibleCells]) {
        NSIndexPath *indexPath = [self.largeGameView indexPathForCell:cell];
        MGCard *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card animate:YES];
    }
    
}

- (IBAction)flipCard:(UIGestureRecognizer *)gesture
{
    CGPoint tapLocation = [gesture locationInView:_largeGameView];
    NSIndexPath *indexPath = [_largeGameView indexPathForItemAtPoint:tapLocation];
    
    if (indexPath) {
        [self.game flipCardAtIndex:indexPath.item];
        [self updateUI];
    }
    
}

@end
