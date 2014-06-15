//
//  TPScrollingNode.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/15/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TPScrollingNode : SKNode

@property (nonatomic) CGFloat horizontalScrollSpeed; // Distance to scroll per second.

-(void)updateWithTimeElapsed:(NSTimeInterval)timeElapsed;

@end
