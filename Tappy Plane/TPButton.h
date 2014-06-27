//
//  TPButton.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/21/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SoundManager.h"

@interface TPButton : SKSpriteNode

@property (nonatomic, readonly, weak) id pressedTarget;
@property (nonatomic, readonly) SEL pressedAction;
@property (nonatomic) CGFloat pressedScale;
@property (nonatomic) Sound *pressedSound;

+(instancetype)spriteNodeWithTexture:(SKTexture *)texture;
-(void)setPressedTarget:(id)pressedTarget withAction:(SEL)pressedAction;

@end
