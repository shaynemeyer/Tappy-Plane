//
//  TPObstacleLayer.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/17/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPObstacleLayer.h"

@interface TPObstacleLayer ()

@property (nonatomic) CGFloat marker;

@end

static const CGFloat kTPMarkerBuffer = 200.0;
static NSString *const kTPKeyMountainUp = @"MountainUp";
static NSString *const kTPKeyMountainDown = @"MountainDown";

@implementation TPObstacleLayer

-(void)updateWithTimeElapsed:(NSTimeInterval)timeElapsed
{
    [super updateWithTimeElapsed:timeElapsed];
    
    if (self.scrolling && self.scene) {
        // Find marker's location in scene coords.
        CGPoint markerLocationInScene = [self convertPoint:CGPointMake(self.marker, 0) toNode:self.scene];
        // When marker comes onto screen, add new obstacles.
        if (markerLocationInScene.x - (self.scene.size.width * self.scene.anchorPoint.x) < self.scene.size.width + kTPMarkerBuffer) {
            // if our marker is within 200 pixels from the right of the screen, add new obstacle.
            [self addObstacleSet];
        }
    }
}

-(void)addObstacleSet
{
    
}

-(SKSpriteNode*)createObjectForKey:(NSString*)key
{
    SKSpriteNode *object = nil;
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"Graphics"];
    if (key == kTPKeyMountainUp) {
        object = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"MountainGrass"]];
        [self addChild:object];
    } else if (kTPKeyMountainDown) {
        object = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"MountainGrassDown"]];
        [self addChild:object];
    }
    
    if (object) {
        object.name = key;
    }
    
    return object;
}

@end
