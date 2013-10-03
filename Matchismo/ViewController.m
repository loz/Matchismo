//
//  ViewController.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 02/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "ThreeCardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipResultLabel;
- (IBAction)dealAgain:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameMode;
- (IBAction)switchGame:(id)sender;
@end

@implementation ViewController

-(id)game {
    if(!_game) [self resetGame];
    return _game;
}

-(NSArray *)gameTypes {
  return @[[CardMatchingGame class], [ThreeCardMatchingGame class]];
}

-(Class)gameType {
  return [self.gameTypes objectAtIndex:[self.gameMode selectedSegmentIndex]];
}

-(void)setCardButtons:(NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

-(void) resetGame {
    Class game = [self gameType];
    NSLog(@"Game Type %@ (%d)", game, [self.gameMode selectedSegmentIndex]);
    _game = [[game alloc] initWithCardCount:self.cardButtons.count
                                              usingDeck:[[PlayingCardDeck alloc] init]];
}

-(void) updateUI {
    for(UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.flipResultLabel.text = self.game.resultMessage;
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", _flipCount];
}

-(IBAction)dealAgain:(id)sender {
    self.gameMode.enabled = YES;
    self.flipCount = 0;
    [self resetGame];
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    self.gameMode.enabled = NO;
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}

- (IBAction)switchGame:(id)sender {
    [self resetGame];
}
@end
