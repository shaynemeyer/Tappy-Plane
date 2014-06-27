//
//  TPCollectable.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/17/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPCollectable.h"

@implementation TPCollectable

-(void)collect
{
    [self.collectionSound play];
    [self runAction:[SKAction removeFromParent]];
    if (self.delegate) {
        [self.delegate wasCollected:self];
    }
}

@end
