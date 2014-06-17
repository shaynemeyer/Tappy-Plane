//
//  TPGameScene.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/15/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPGameScene.h"
#import "TPPlane.h"
#import "TPScrollingLayer.h"
#import "TPConstants.h"

@interface TPGameScene ()

@property (nonatomic) TPPlane *player;
@property (nonatomic) SKNode *world;
@property (nonatomic) TPScrollingLayer *background;
@property (nonatomic) TPScrollingLayer *foreground;
@end

static const CGFloat kMinFPS = 10.0 / 60.0;

@implementation TPGameScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        
        // Set background color to sky blue. Red = 213/255 = 0.8 Green = 237/255  Blue = 247/255
        self.backgroundColor = [SKColor colorWithRed:0.835294118 green:0.929411765 blue:0.968627451 alpha:1.0];
        
        // Get atlas file.
        SKTextureAtlas *graphics = [SKTextureAtlas atlasNamed:@"Graphics"];
        
        // Setup physics.
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.5);
        self.physicsWorld.contactDelegate = self;
        
        // Setup world.
        _world = [SKNode node];
        [self addChild:_world];
        
        // Setup background.
        NSMutableArray *backgroundTiles = [[NSMutableArray alloc] init];
        for (int i = 0; i < 3; i++) {
            [backgroundTiles addObject:[SKSpriteNode spriteNodeWithTexture:[graphics textureNamed:@"background"]]];
        }
        
        _background = [[TPScrollingLayer alloc] initWithTiles:backgroundTiles];
        _background.position = CGPointZero;
        _background.horizontalScrollSpeed = -60;
        _background.scrolling = YES;
        [_world addChild: _background];
        
        // Setup foreground.
        _foreground = [[TPScrollingLayer alloc] initWithTiles:@[[self generateGroundTile],
                                                                [self generateGroundTile],
                                                                [self generateGroundTile]]];
        _foreground.position = CGPointZero;
        _foreground.horizontalScrollSpeed = -80;
        _foreground.scrolling = YES;
        [_world addChild:_foreground];
        
        _player = [[TPPlane alloc] init];
        _player.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
        _player.physicsBody.affectedByGravity = NO;
        
        [_world addChild:_player];      
        _player.engineRunning = YES;
    }
    return self;
}

-(SKSpriteNode*)generateGroundTile
{
    // Get atlas file.
    SKTextureAtlas *graphics = [SKTextureAtlas atlasNamed:@"Graphics"];
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:[graphics textureNamed:@"groundGrass"]];
    sprite.anchorPoint = CGPointZero;
    
    CGFloat offsetX = sprite.frame.size.width * sprite.anchorPoint.x;
    CGFloat offsetY = sprite.frame.size.height * sprite.anchorPoint.y;
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 403 - offsetX, 16 - offsetY);
    CGPathAddLineToPoint(path, NULL, 371 - offsetX, 35 - offsetY);
    CGPathAddLineToPoint(path, NULL, 329 - offsetX, 32 - offsetY);
    CGPathAddLineToPoint(path, NULL, 285 - offsetX, 8 - offsetY);
    CGPathAddLineToPoint(path, NULL, 237 - offsetX, 12 - offsetY);
    CGPathAddLineToPoint(path, NULL, 201 - offsetX, 28 - offsetY);
    CGPathAddLineToPoint(path, NULL, 174 - offsetX, 20 - offsetY);
    CGPathAddLineToPoint(path, NULL, 153 - offsetX, 21 - offsetY);
    CGPathAddLineToPoint(path, NULL, 124 - offsetX, 32 - offsetY);
    CGPathAddLineToPoint(path, NULL, 77 - offsetX, 30 - offsetY);
    CGPathAddLineToPoint(path, NULL, 45 - offsetX, 11 - offsetY);
    CGPathAddLineToPoint(path, NULL, 0 - offsetX, 16 - offsetY);
    
    sprite.physicsBody = [SKPhysicsBody bodyWithEdgeChainFromPath:path];
    sprite.physicsBody.categoryBitMask = kTPCategoryGround;
    return sprite;
}

-(void)newGame
{
    // Reset layers.
    self.foreground.position = CGPointZero;
    [self.foreground layoutTiles];
    self.background.position = CGPointZero;
    [self.background layoutTiles];
    
    // Reset plane.
    self.player.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
    self.player.crashed = NO;
    self.player.engineRunning = YES;
    self.player.physicsBody.affectedByGravity = NO;
    self.player.physicsBody.velocity = CGVectorMake(0.0, 0.0);
    self.player.zRotation = 0.0;
    self.player.physicsBody.angularVelocity = 0.0;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        if (self.player.crashed) {
            // Reset game.
            [self newGame];
        } else {
            _player.physicsBody.affectedByGravity = YES;
            self.player.accelerating = YES;
        }
        
        
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        
        self.player.accelerating = NO;
    }
}

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    if (contact.bodyA.categoryBitMask == kTPCategoryPlane) {
        [self.player collide:contact.bodyB];
    } else if (contact.bodyB.categoryBitMask == kTPCategoryPlane){
        [self.player collide:contact.bodyA];
    }
        
}

-(void)update:(NSTimeInterval)currentTime
{
    static NSTimeInterval lastCallTime;
    NSTimeInterval timeElapsed = currentTime - lastCallTime;
    if (timeElapsed > kMinFPS) {
        timeElapsed = kMinFPS;
    }
    lastCallTime = currentTime;
    
    [self.player update];
    if (!self.player.crashed) {
        [self.background updateWithTimeElapsed:timeElapsed];
        [self.foreground updateWithTimeElapsed:timeElapsed];
    }
    
    
}

@end
