//
//  SetCard.h
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
+(NSArray *)validColors;
+(NSArray *)validShades;
+(int)numSymbols;
+(int)numCount;
+(NSDictionary *)symbolStrings;

@property (strong, nonatomic) NSString *colour;
@property (nonatomic) int symbol;
@property (strong, nonatomic) NSString *shading;
@property (nonatomic) int number;
@end
