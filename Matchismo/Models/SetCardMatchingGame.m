//
//  SetCardMatchingGame.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 05/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "SetCardMatchingGame.h"

@implementation SetCardMatchingGame


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
                
            } else if (faceUpCards.count > 2){
                //Too Many, so no match
                [faceUpCards makeObjectsPerformSelector:@selector(flipDown)];
            } else {
                //Still Choosing
                
            }
        }
        card.faceUp = !card.isFaceUp;
    }
}

@end
