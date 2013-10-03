//
//  ThreeCardMatchingGame.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "ThreeCardMatchingGame.h"

@interface ThreeCardMatchingGame()
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) NSString *resultMessage;
@end

#define MATCH_BONUS 16
#define MISMATCH_PENALTY 1
#define FLIP_COST 1

@implementation ThreeCardMatchingGame
-(void)flipCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    int matchedCount = 0;
    Card *firstMatch;
    
    if(!card.isUnplayable) {
        if(!card.isFaceUp) {
            self.resultMessage = nil;
            //Flipping up, match the card if can
            for(Card *otherCard in self.cards) {
                if(otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore) {
                        matchedCount++;
                        if (matchedCount == 2) {
                            int points = matchScore * MATCH_BONUS;;
                            otherCard.unplayable = YES;
                            card.unplayable = YES;
                            firstMatch.unplayable = YES;
                            self.score += points;
                            self.resultMessage = [NSString stringWithFormat:@"Matched %@ & %@ & %@ for %d points",
                                              card.contents, firstMatch.contents, otherCard.contents,
                                              points];
                        } else {
                            firstMatch = otherCard;
                        }
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
