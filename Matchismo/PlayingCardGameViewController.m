//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 06/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayingCardView.h"
#import "PlayingCardCollectionViewCell.h"
#import "PlayingCardMatchingGame.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

-(Class)gameType {
    return [PlayingCardMatchingGame class];
}

-(Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

-(NSUInteger)startingCardCount {
    return 20;
}


-(void)updateCell:(UICollectionViewCell *)cell UsingCard:(Card *)card {
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
        PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).playingCardView;
        if([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.rank = playingCard.rank;
            playingCardView.suit = playingCard.suit;
            playingCardView.faceUp = playingCard.faceUp;
            playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}

@end
