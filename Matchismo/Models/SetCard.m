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

+(NSArray *)validColors {
    return @[@"red", @"green", @"purple"];
}

+(NSArray *)validShades {
    return @[@"solid", @"striped", @"outline"];
}

+(int)numSymbols {
    return 3;
}

+(int)numCount {
    return 3;
}

+(NSDictionary *)symbolStrings {
    return @{
             @"solid":@[@"▲", @"●", @"■"],
             @"striped":@[@"△", @"○", @"□"],
             @"outline":@[@"△", @"○", @"□"]
             };
}

-(void)setColour:(NSString *)colour {
    if([[SetCard validColors] containsObject:colour]) {
        _colour = colour;
    }
}

-(void)setSymbol:(int)symbol {
    if(symbol >=0 && symbol < [SetCard numSymbols]) {
        _symbol = symbol;
    }
}

-(void)setShading:(NSString *)shading {
    if([[SetCard validShades] containsObject:shading]) {
        _shading = shading;
    }
}

-(void)setNumber:(int)number {
    if(number >=1 && number <= [SetCard numCount]) {
        _number = number;
    }
}

@end
