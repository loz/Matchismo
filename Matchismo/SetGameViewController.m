//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 03/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "SetGameViewController.h"
#import "CardMatchingGame.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipResultLabel;
- (IBAction)flipCard:(id)sender;
@end

@implementation SetGameViewController

-(id)game {
    if(!_game) [self resetGame];
    return _game;
}

-(void) resetGame {
    _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                              usingDeck:[[SetCardDeck alloc] init]];
}

-(IBAction)dealAgain:(id)sender {
    [super dealAgain:sender];
}

- (IBAction)flipCard:(UIButton *)sender {
    [super flipCard:sender];
}

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

-(UIColor *)colorForCard:(SetCard *)card {
    if([card.shading isEqualToString:@"solid"]) {
        if([card.colour isEqualToString:@"red"]) {
            return [UIColor redColor];
        } else if ([card.colour isEqualToString:@"green"]) {
            return [UIColor colorWithRed:0.0 green:0.6 blue:0.0 alpha:1.0];
        } else { //purple
            return [UIColor purpleColor];
        }
    } else if ([card.shading isEqualToString:@"striped"]) {
        return [UIColor lightGrayColor];
    } else {
        return [UIColor clearColor];
    }
}

-(UIColor *)strokeColorForCard:(SetCard *)card {
    if(![card.shading isEqualToString:@"solid"]) {
        if([card.colour isEqualToString:@"red"]) {
            return [UIColor redColor];
        } else if ([card.colour isEqualToString:@"green"]) {
            return [UIColor colorWithRed:0.0 green:0.6 blue:0.0 alpha:1.0];
        } else { //purple
            return [UIColor purpleColor];
        }
    } else {
        return [UIColor clearColor];
    }
}

-(NSInteger)strikeForCard:(SetCard *)card {
    if([card.shading isEqualToString:@"striped"]) {
        return NSUnderlinePatternSolid;
    } else {
        return NSUnderlineStyleNone;
    }
}

@end
