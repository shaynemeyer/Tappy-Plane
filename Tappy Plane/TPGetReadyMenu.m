//
//  TPGetReadyMenu.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/26/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPGetReadyMenu.h"

@interface TPGetReadyMenu()

@property (nonatomic) SKSpriteNode *getReadyTitle;
@property (nonatomic) SKNode *tapGroup;

@end

@implementation TPGetReadyMenu

-(instancetype)initWithSize:(CGSize)size andPlanePosition:(CGPoint)planPosition
{
    if (self = [self init]) {
        _size = size;
        
        // Get graphics atlas
        SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"Graphics"];
        // Setup get ready text.
        _getReadyTitle = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"textGetReady"]];
        _getReadyTitle.position = CGPointMake(size.width * 0.75, planPosition.y);
        [self addChild:_getReadyTitle];
        
        // Setup group for tap related nodes.
        _tapGroup = [SKNode node];
        _tapGroup.position = planPosition;
        [self addChild:_tapGroup];
        
        // Setup right tap tag.
        SKSpriteNode *rightTapTag = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"tapLeft"]];
        rightTapTag.position = CGPointMake(55, 0);
        [self.tapGroup addChild:rightTapTag];
        
        // Setup left tap tag.
        SKSpriteNode *leftTapTag = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"tapRight"]];
        leftTapTag.position = CGPointMake(-55, 0);
        [self.tapGroup addChild:leftTapTag];
        
        // Get frames for tap animation
        NSArray *tapAnimationFrames = @[[atlas textureNamed:@"tap"],
                                        [atlas textureNamed:@"tapTick"],
                                        [atlas textureNamed:@"tapTick"]];
        // Create action for tap animation
        SKAction *tapAnimation = [SKAction animateWithTextures:tapAnimationFrames timePerFrame:0.5 resize:YES restore:NO];
        
        
        // Setup tap hand.
        SKSpriteNode *tapHand = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"tap"]];
        tapHand.position = CGPointMake(0, -40);
        [self.tapGroup addChild:tapHand];
        [tapHand runAction:[SKAction repeatActionForever:tapAnimation]];
        
    }
    return self;
}

-(void)show
{
    
}

-(void)hide
{
    
}


@end
