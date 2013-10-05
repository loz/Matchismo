//
//  SetCard.h
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "Card.h"

#define RED 1
#define GREEN 2
#define PURPLE 3

#define SOLID 1
#define OUTLINE 2
#define SHADED 3

@interface SetCard : Card
+(NSArray *)validColours;
+(NSArray *)validShades;
+(int)numSymbols;
+(int)numCount;
+(NSArray *)symbolStrings;

-(NSString *)symbolString;

@property (nonatomic) int colour;
@property (nonatomic) int symbol;
@property (nonatomic) int shading;
@property (nonatomic) int number;
@end
