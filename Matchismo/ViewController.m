//
//  ViewController.m
//  Matchismo
//
//  Created by Jonathan Lozinski on 02/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;
@end

@implementation ViewController

-(PlayingCardDeck *)deck {
    if(!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", _flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    if(sender.selected) {
        sender.selected = NO;
    } else {
        PlayingCard *card = (PlayingCard *)[self.deck drawRandomCard];
        [sender setTitle: card.contents
                forState:UIControlStateSelected];
        sender.selected = YES;
    }
    self.flipCount++;
}

@end
