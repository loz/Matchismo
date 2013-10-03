//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) NSString *resultMessage;
@end

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

@implementation CardMatchingGame
-(NSMutableArray *)cards {
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    self = [super init];
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
    Card *card = [self cardAtIndex:index];
    if(!card.isUnplayable) {
        if(!card.isFaceUp) {
            self.resultMessage = nil;
            //Flipping up, match the card if can
            for(Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore) {
                        int points = matchScore * MATCH_BONUS;;
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += points;
                        self.resultMessage = [NSString stringWithFormat:@"Matched %@ & %@ for %d points",
                                              card.contents, otherCard.contents,
                                              points];
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.resultMessage = [NSString stringWithFormat:@"%@ & %@ don't match! %d point penalty!",
                                              card.contents, otherCard.contents,
                                              MISMATCH_PENALTY];
                    }
                }
            }
            if (self.resultMessage == nil) {
                self.resultMessage = [NSString stringWithFormat:@"Flipped up %@",
                                          card.contents];
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}
@end
