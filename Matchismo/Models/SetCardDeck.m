//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck
-(id)init {
    self = [super init];
    if (self) {
        for(NSNumber *colour in [SetCard validColours]) {
            for(int symbol = 0; symbol < [SetCard numSymbols]; symbol++) {
                for (NSNumber *shade in [SetCard validShades]) {
                    for(int number=1; number <= [SetCard numCount]; number++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.colour = [colour intValue];
                        card.symbol = symbol;
                        card.shading = [shade intValue];
                        card.number = number;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}
@end
