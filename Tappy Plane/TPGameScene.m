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
#import "TPObstacleLayer.h"
#import "TPBitmapFontLabel.h"
#import "TPTilesetTextureProvider.h"

@interface TPGameScene ()

@property (nonatomic) TPPlane *player;
@property (nonatomic) SKNode *world;
@property (nonatomic) TPScrollingLayer *background;
@property (nonatomic) TPScrollingLayer *foreground;
@property (nonatomic) TPObstacleLayer *obstacles;
@property (nonatomic) TPBitmapFontLabel *scoreLabel;
@property (nonatomic) NSInteger score;
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
        self.physicsWorld.gravity = CGVectorMake(0.0, -4.0);
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
        _background.horizontalScrollSpeed = -60;
        _background.scrolling = YES;
        [_world addChild: _background];
        
        // Setup obstacle layer.
        _obstacles = [[TPObstacleLayer alloc] init];
        _obstacles.collectableDelegate = self;
        _obstacles.horizontalScrollSpeed = -80;
        _obstacles.scrolling = YES;
        _obstacles.floor = 0.0;
        _obstacles.ceiling = self.size.height;
        [_world addChild:_obstacles];
        
        // Setup foreground.
        _foreground = [[TPScrollingLayer alloc] initWithTiles:@[[self generateGroundTile],
                                                                [self generateGroundTile],
                                                                [self generateGroundTile]]];
        _foreground.horizontalScrollSpeed = -80;
        _foreground.scrolling = YES;
        [_world addChild:_foreground];
        
        _player = [[TPPlane alloc] init];
        _player.physicsBody.affectedByGravity = NO;
        
        [_world addChild:_player];
        
        // Setup score label.
        _scoreLabel = [[TPBitmapFontLabel alloc] initWithText:@"0" andFontName:@"number"];
        _scoreLabel.position = CGPointMake(self.size.width * 0.5, self.size.height -100);
        [self addChild:_scoreLabel];
       
        // Start a new game.
        [self newGame];
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
    // Randomize tileset.
    [[TPTilesetTextureProvider getProvider] randomizeTileset];
    
    // Reset layers.
    self.foreground.position = CGPointZero;
    for (SKSpriteNode *node in self.foreground.children) {
        node.texture = [[TPTilesetTextureProvider getProvider] getTextureForKey:@"ground"];
    }
    [self.foreground layoutTiles];
    
    self.obstacles.position = CGPointZero;
    [self.obstacles reset];
    self.obstacles.scrolling = NO;
    
    self.background.position = CGPointZero;
    [self.background layoutTiles];
    
    // Reset score.
    self.score = 0;
    
    // Reset plane.
    self.player.position = CGPointMake(self.size.width * 0.3, self.size.height * 0.5);
    self.player.physicsBody.affectedByGravity = NO;
    [self.player reset];
}

-(void)wasCollected:(TPCollectable *)collectable
{
    self.score += collectable.pointValue;
}

-(void)setScore:(NSInteger)score
{
    _score = score;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld", (long)score];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
        if (self.player.crashed) {
            // Reset game.
            [self newGame];
        } else {
            [_player flap];
            _player.physicsBody.affectedByGravity = YES;
            self.obstacles.scrolling = YES;
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
        [self.obstacles updateWithTimeElapsed:timeElapsed];
    }
    
    
}

@end
