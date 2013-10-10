//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Jonathan Lozinski on 02/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController
-(Class)gameType;
@property (strong, nonatomic) CardMatchingGame *game;
-(Deck *)createDeck; //abstract
-(void)updateCell:(UICollectionViewCell *)cell UsingCard:(Card *)card; //abstract
@property (nonatomic) NSUInteger startingCardCount; //abstract
-(void) updateUI;
@end
