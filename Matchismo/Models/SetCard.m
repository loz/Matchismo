//
//  SetCard.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
/*
 COLOURS: RED/GREEN/PURPLE
 SYMBOLS: TRIANGLE/CIRCLE/SQUARE
 SHADING: SOLID/STRIPED/OUTLINED
 NUMBER:  ONE/TWO/THREE SYMBOLS
*/

+(NSArray *)validColours {
    return @[@RED, @GREEN, @PURPLE];
}

+(NSArray *)validShades {
    return @[@SOLID, @OUTLINE, @SHADED];
}

+(int)numSymbols {
    return 3;
}

+(int)numCount {
    return 3;
}

+(NSArray *)symbolStrings {
    return @[@"▲", @"●", @"■"];
}

-(NSString *)symbolString {
    return [[[self class] symbolStrings] objectAtIndex:(NSUInteger)self.symbol];
}

-(void)setColour:(int)colour {
    if([[SetCard validColours] containsObject:[NSNumber numberWithInt:colour]]) {
        _colour = colour;
    }
}

-(void)setSymbol:(int)symbol {
    if(symbol >=0 && symbol < [SetCard numSymbols]) {
        _symbol = symbol;
    }
}

-(void)setShading:(int)shading {
    if([[SetCard validShades] containsObject:[NSNumber numberWithInt:shading]]) {
        _shading = shading;
    }
}

-(void)setNumber:(int)number {
    if(number >=1 && number <= [SetCard numCount]) {
        _number = number;
    }
}

-(int)match:(NSArray *)otherCards {
    int score = 0;
    if (otherCards.count == 2) {
        SetCard *second = [otherCards objectAtIndex:0];
        SetCard *third  = [otherCards objectAtIndex:1];
        if ([self matchesSymbolWithSecond:second andThird:third] &&
            [self matchesNumberWithSecond:second andThird:third] &&
            [self matchesColourWithSecond:second andThird:third] &&
            [self matchesShadingWithSecond:second andThird:third]) {
            score = 1;
        }
    }
    return score;
}

-(BOOL)matchesSymbolWithSecond:(SetCard *)second andThird:(SetCard *)third {
    return (
            self.symbol == second.symbol &&
            self.symbol == third.symbol
        ) || (
            self.symbol != second.symbol &&
            self.symbol != third.symbol &&
            second.symbol != third.symbol
        );
}

-(BOOL)matchesNumberWithSecond:(SetCard *)second andThird:(SetCard *)third {
    return (
            self.number == second.number &&
            self.number == third.number
            ) || (
                  self.number != second.number &&
                  self.number != third.number &&
                  second.number != third.number
                  );
}

-(BOOL)matchesColourWithSecond:(SetCard *)second andThird:(SetCard *)third {
    return (
            self.colour == second.colour &&
            self.colour == third.colour
            ) || (
                  self.colour != second.colour &&
                  self.colour != third.colour &&
                  second.colour != third.colour
                  );
}

-(BOOL)matchesShadingWithSecond:(SetCard *)second andThird:(SetCard *)third {
    return (
            self.shading == second.shading &&
            self.shading == third.shading
            ) || (
                  self.shading != second.shading &&
                  self.shading != third.shading &&
                  second.shading != third.shading
                  );
}

@end
