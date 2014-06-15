//
//  TPGameScene.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/15/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPGameScene.h"

@implementation TPGameScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        
        SKSpriteNode *plane1 = [SKSpriteNode spriteNodeWithImageNamed:@"planeBlue1@2x"];
        plane1.position = CGPointMake(50, 50);
        [self addChild:plane1];
        
        SKSpriteNode *plane2 = [SKSpriteNode spriteNodeWithImageNamed:@"planeRed1@2x"];
        plane2.position = CGPointMake(100, 50);
        [self addChild:plane2];
        
        SKSpriteNode *plane3 = [SKSpriteNode spriteNodeWithImageNamed:@"planeGreen1@2x"];
        plane3.position = CGPointMake(150, 50);
        [self addChild:plane3];
        
        SKSpriteNode *plane4 = [SKSpriteNode spriteNodeWithImageNamed:@"planeYellow1@2x"];
        plane4.position = CGPointMake(200, 50);
        [self addChild:plane4];
        
        
    }
    return self;
}

@end
