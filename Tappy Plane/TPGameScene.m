//
//  TPGameScene.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/15/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPGameScene.h"

@implementation TPGameScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        NSLog(@"Size: %f %f", size.width, size.height);
    }
    return self;
}

@end
