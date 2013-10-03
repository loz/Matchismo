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
        for(NSString *colour in [SetCard validColors]) {
            for(int symbol = 0; symbol < [SetCard numSymbols]; symbol++) {
                for (NSString *shade in [SetCard validShades]) {
                    for(int number=1; number <= [SetCard numCount]; number++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.colour = colour;
                        card.symbol = symbol;
                        card.shading = shade;
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
