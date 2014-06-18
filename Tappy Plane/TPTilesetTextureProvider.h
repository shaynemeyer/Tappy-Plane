//
//  TPTilesetTextureProvider.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/18/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface TPTilesetTextureProvider : NSObject

+(instancetype)getProvider;

-(void)randomizeTileset;
-(SKTexture*)getTextureForKey:(NSString*)key;

@end
