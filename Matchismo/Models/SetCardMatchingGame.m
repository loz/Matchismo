//
//  SetCardMatchingGame.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 05/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "SetCardMatchingGame.h"
#import "card.h"

@interface SetCardMatchingGame()
@property (nonatomic, readwrite) int score;
@end

@implementation SetCardMatchingGame

#define POINTS_FOR_SET 10
#define PENALTY 3
#define FLIP_COST 1

-(void)flipCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if(!card.isUnplayable) {
        if(!card.isFaceUp) {
            NSMutableArray *faceUpCards = [[NSMutableArray alloc] init];
            
            for(Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [faceUpCards addObject:otherCard];
                }
            }
            if (faceUpCards.count == 2) {
                //Three Cards for a Set
                if ([card match:faceUpCards]) {
                    [faceUpCards makeObjectsPerformSelector:@selector(makeUnplayable)];
                    card.unplayable = YES;
                    card.faceUp = YES;
                    self.score += POINTS_FOR_SET;
                } else {
                    [faceUpCards makeObjectsPerformSelector:@selector(flipDown)];
                    self.score -= PENALTY;
                }
            } else {
                //Still Choosing
                card.faceUp = YES;
                self.score -= FLIP_COST;
            }
        } else {
            card.faceUp = NO;
        }

    }
}

@end
