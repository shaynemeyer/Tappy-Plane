//
//  TPTilesetTextureProvider.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/18/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPTilesetTextureProvider.h"

@implementation TPTilesetTextureProvider

+(instancetype)getProvider
{
    static TPTilesetTextureProvider *provider = nil;
    @synchronized(self){
        if(!provider){
            provider = [[TPTilesetTextureProvider alloc] init];
        }
        return provider;
    }
}

@end
