//
//  SetCardCollectionViewCell.h
//  Matchismo
//
//  Created by Jonathan Lozinski on 10/10/2013.
//  Copyright (c) 2013 Jonathan Lozinski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCardView.h"

@interface SetCardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet SetCardView *setCardView;
@end
