//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 02/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "CardGameViewController.h"
#import "Card.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipResultLabel;
@end

@implementation CardGameViewController

-(id)game {
    if(!_game) [self resetGame];
    return _game;
}


-(void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

-(void) resetGame {
    _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                              usingDeck:[[PlayingCardDeck alloc] init]];
}

-(void) updateUI {
    for(UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setAttributedTitle:[self contentForCard:card] forState:UIControlStateSelected];
        [cardButton setAttributedTitle:[self contentForCard:card] forState:UIControlStateSelected|UIControlStateDisabled];
        [cardButton setAttributedTitle:[self contentForRearCard:card] forState:UIControlStateNormal];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        if (card.isFaceUp) {
            cardButton.backgroundColor = [UIColor whiteColor];
        } else {
            cardButton.backgroundColor = [UIColor lightGrayColor];
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.flipResultLabel.text = self.game.resultMessage;
}

-(NSAttributedString *)contentForCard:(Card *)card {
    return [[NSAttributedString alloc] initWithString:card.contents];
}

-(NSAttributedString *)contentForRearCard:(Card *)card {
    return [[NSAttributedString alloc] initWithString:@""];
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", _flipCount];
}

-(IBAction)dealAgain:(id)sender {
    self.flipCount = 0;
    [self resetGame];
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}
@end
