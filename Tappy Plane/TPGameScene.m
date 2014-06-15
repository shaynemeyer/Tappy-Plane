//
//  TPGameScene.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/15/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPGameScene.h"
#import "TPPlane.h"

@interface TPGameScene ()

@property (nonatomic) TPPlane *player;
@property (nonatomic) SKNode *world;

@end

@implementation TPGameScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        
        // Setup physics.
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.5);
        
        // Setup world.
        _world = [SKNode node];
        [self addChild:_world];
        
        _player = [[TPPlane alloc] init];
        _player.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.5);
        _player.physicsBody.affectedByGravity = NO;
        _player.engineRunning = YES;
        [_world addChild:_player];      
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        _player.physicsBody.affectedByGravity = YES;
        self.player.accelerating = YES;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        
        self.player.accelerating = NO;
    }
}

-(void)update:(NSTimeInterval)currentTime
{
    [self.player update];
}

@end
