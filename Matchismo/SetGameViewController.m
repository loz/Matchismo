//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardMatchingGame.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetGameViewController ()
@end

@implementation SetGameViewController

-(NSAttributedString *)contentForCard:(Card *)card {
    SetCard *setCard = (SetCard *)card;
    NSMutableString *symbols = [[NSMutableString alloc] init];
    
    //Set Number of Symbols
    for (int i=0; i < setCard.number; i++) {
        [symbols appendString:[setCard symbolString]];
    }
    
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:symbols];
    NSRange charRange = [symbols rangeOfString:symbols];
    //Set Attributes
    [content addAttributes:@{
                             NSForegroundColorAttributeName: [self colorForCard:setCard],
                             NSStrokeWidthAttributeName: @-5,
                             NSStrokeColorAttributeName: [self strokeColorForCard:setCard]
                             }
                     range:charRange];
    return [content copy];
}

-(NSAttributedString *)contentForRearCard:(Card *)card {
    return [self contentForCard:card];
}

-(UIColor *)colorForCard:(SetCard *)card {
    if(card.shading == SOLID) {
        if(card.colour == RED) {
            return [UIColor redColor];
        } else if (card.colour == GREEN) {
            return [UIColor colorWithRed:0.0 green:0.6 blue:0.0 alpha:1.0];
        } else { //purple
            return [UIColor purpleColor];
        }
    } else if (card.shading == SHADED) {
        return [UIColor grayColor];
    } else {
        return [UIColor clearColor];
    }
}

-(UIColor *)strokeColorForCard:(SetCard *)card {
    if(card.shading != SOLID) {
        if(card.colour == RED) {
            return [UIColor redColor];
        } else if (card.colour == GREEN) {
            return [UIColor colorWithRed:0.0 green:0.6 blue:0.0 alpha:1.0];
        } else { //purple
            return [UIColor purpleColor];
        }
    } else {
        return [UIColor clearColor];
    }
}

-(NSInteger)strikeForCard:(SetCard *)card {
    if(card.shading == SHADED) {
        return NSUnderlinePatternSolid;
    } else {
        return NSUnderlineStyleNone;
    }
}

@end
