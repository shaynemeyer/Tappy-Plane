//
//  TPCollectable.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/17/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class TPCollectable;

@protocol TPCollectableDelegate <NSObject>

-(void)wasCollected:(TPCollectable*)collectable;

@end

@interface TPCollectable : SKSpriteNode

@property (nonatomic, weak) id<TPCollectableDelegate> delegate;
@property (nonatomic) NSInteger pointValue;

-(void)collect;

@end
