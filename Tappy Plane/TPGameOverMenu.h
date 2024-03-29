//
//  TPGameOverMenu.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/23/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef enum : NSUInteger {
    MedalNone,
    MedalBronze,
    MedalSilver,
    MedalGold,
} MedalType;

@protocol TPGameOverMenuDelegate <NSObject>

-(void)pressedStartNewGameButton;

@end

@interface TPGameOverMenu : SKNode

@property (nonatomic) CGSize size;
@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger bestScore;
@property (nonatomic) MedalType medal;
@property (nonatomic, weak) id<TPGameOverMenuDelegate> delegate;

-(instancetype)initWithSize:(CGSize)size;
-(void)show;

@end
