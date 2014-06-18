//
//  TPPlane.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/15/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TPPlane : SKSpriteNode

@property (nonatomic) BOOL engineRunning;
@property (nonatomic) BOOL crashed;

-(void)flap;
-(void)setRandomColor;
-(void)update;
-(void)collide:(SKPhysicsBody*)body;
-(void)reset;
@end
