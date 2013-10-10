//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardCollectionViewCell.h"
#import "SetCardMatchingGame.h"
#import "SetCardDeck.h"
#import "SetCardView.h"
#import "SetCard.h"

@interface SetGameViewController ()
@end

@implementation SetGameViewController
-(Class)gameType {
    return [SetCardMatchingGame class];
}

-(Deck *)createDeck {
    return [[SetCardDeck alloc] init];
}

-(NSUInteger)startingCardCount {
    return 12;
}


-(void)updateCell:(UICollectionViewCell *)cell UsingCard:(Card *)card {
    if ([cell isKindOfClass:[SetCardCollectionViewCell class]]) {
        SetCardView *setCardView = ((SetCardCollectionViewCell *)cell).setCardView;
        if([card isKindOfClass:[SetCard class]]) {
            SetCard *setCard = (SetCard *)card;
            setCardView.colour = setCard.colour-1;
            setCardView.shape = setCard.symbol;
            setCardView.count = setCard.number;
            setCardView.fill = setCard.shading-1;
            setCardView.faceUp = setCard.faceUp;
            setCardView.alpha = setCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}

- (IBAction)dealMoreCards:(id)sender {
    SetCardMatchingGame *setGame = (SetCardMatchingGame *)self.game;
    [setGame dealMoreCards];
    [self updateUI];
}

@end
