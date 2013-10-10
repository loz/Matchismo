//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 02/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "CardGameViewController.h"
#import "Card.h"
#import "CardMatchingGame.h"

@interface CardGameViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipResultLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@end

@implementation CardGameViewController

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.startingCardCount;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell UsingCard:card];
    return cell;
}

-(void)updateCell:(UICollectionViewCell *)cell UsingCard:(Card *)card {
    //abstact
}

-(id)game {
    if(!_game) [self resetGame];
    return _game;
}

-(void) resetGame {
    _game = [[[self gameType] alloc] initWithCardCount:self.startingCardCount
                                              usingDeck:[self createDeck]];
    }

-(Deck *)createDeck {
    return nil; //abstract
}

-(Class)gameType {
    return [CardMatchingGame class];
}


-(void) updateUI {
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]){
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell UsingCard:card];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

-(NSAttributedString *)contentForCard:(Card *)card {
    return [[NSAttributedString alloc] initWithString:card.contents];
}

-(NSAttributedString *)contentForRearCard:(Card *)card {
    return [[NSAttributedString alloc] initWithString:@""];
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", _flipCount];
}

-(IBAction)dealAgain:(id)sender {
    self.flipCount = 0;
    [self resetGame];
    [self updateUI];
}

- (IBAction)flipCard:(UITapGestureRecognizer *)gesture {
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        [self.game flipCardAtIndex:indexPath.item];
        self.flipCount++;
        [self updateUI];
    }

}
@end
