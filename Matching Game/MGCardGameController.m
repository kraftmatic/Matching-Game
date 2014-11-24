//
//  MGCardGameController.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGCardGameController.h"
#import "MGMemoryGame.h"

@interface MGCardGameController () <UICollectionViewDataSource>

@property (nonatomic, strong) MGMemoryGame *game;
@property (weak, nonatomic) IBOutlet UICollectionView *gameView;

@end

@implementation MGCardGameController

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(MGCard *)card animate:(BOOL)animate{
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MemoryCard" forIndexPath:indexPath];
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
    for (UICollectionViewCell *cell in [self.gameView visibleCells]) {
        NSIndexPath *indexPath = [self.gameView indexPathForCell:cell];
        MGCard *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card animate:YES];
    }

}

- (IBAction)flipCard:(UIGestureRecognizer *)gesture
{
    CGPoint tapLocation = [gesture locationInView:_gameView];
    NSIndexPath *indexPath = [_gameView indexPathForItemAtPoint:tapLocation];
    
    if (indexPath) {
        [self.game flipCardAtIndex:indexPath.item];
        [self updateUI];
    }
    
    
}

@end
