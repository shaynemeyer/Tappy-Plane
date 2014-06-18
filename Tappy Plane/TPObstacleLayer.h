//
//  TPObstacleLayer.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/17/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPScrollingNode.h"
#import "TPCollectable.h"

@interface TPObstacleLayer : TPScrollingNode

@property (nonatomic, weak) id<TPCollectableDelegate> collectableDelegate;
@property (nonatomic) CGFloat floor;
@property (nonatomic) CGFloat ceiling;

-(void)reset;

@end
