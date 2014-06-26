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

@end

@implementation TPGetReadyMenu

-(instancetype)initWithSize:(CGSize)size andPlanePosition:(CGPoint)planPosition
{
    if (self = [self init]) {
        _size = size;
        
        SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"Graphics"];
        
        _getReadyTitle = [SKSpriteNode spriteNodeWithTexture:[atlas textureNamed:@"textGetReady"]];
        _getReadyTitle.position = CGPointMake(size.width * 0.75, planPosition.y);
        [self addChild:_getReadyTitle];
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
