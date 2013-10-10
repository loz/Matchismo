//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 06/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) int score;
@property (strong, nonatomic) Deck* deck;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards {
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    self = [super init];
    self.deck = deck;
    if(self) {
        for(int i =0; i <= cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if(card) {
                self.cards[i] = card;
            } else {
                self = nil;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index {
    return (index < self.cards.count) ? self.cards[index] : nil;
}

-(void)flipCardAtIndex:(NSUInteger)index {
    //abstract
}

-(void)dealMoreCards {
    for(int i=0; i<3; i++) {
        Card *card = [self.deck drawRandomCard];
        [self.cards addObject:card];
    }
}


@end
