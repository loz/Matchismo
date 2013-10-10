//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Jonathan Lozinski on 06/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject
-(id)initWithCardCount:(NSUInteger)cardCount
             usingDeck:(Deck *)deck;
-(void)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readonly) int score;
@property (strong, nonatomic) NSString *resultMessage;
-(void)dealMoreCards;
@end
