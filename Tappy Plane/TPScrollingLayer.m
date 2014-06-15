//
//  TPScrollingLayer.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/15/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPScrollingLayer.h"

@interface  TPScrollingLayer()

@property (nonatomic) SKSpriteNode *rightMostTile;

@end

@implementation TPScrollingLayer

-(id)initWithTiles:(NSArray*)tileSpriteNodes
{
    if (self = [super init]) {
        for (SKSpriteNode *tile in tileSpriteNodes) {
            tile.anchorPoint = CGPointZero;
            tile.name = @"Tile";
            [self addChild:tile];
        }
        [self layoutTiles];
    }
    return self;
}

-(void)layoutTiles
{
    self.rightMostTile = nil;
    [self enumerateChildNodesWithName:@"Tile" usingBlock:^(SKNode *node, BOOL *stop) {
        node.position = CGPointMake(self.rightMostTile.position.x + self.rightMostTile.size.width, node.position.y);
        self.rightMostTile = (SKSpriteNode*)node;
    }];
}

-(void)updateWithTimeElapsed:(NSTimeInterval)timeElapsed
{
    [super updateWithTimeElapsed:timeElapsed];
    
    
}

@end
