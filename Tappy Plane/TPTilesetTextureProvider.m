//
//  TPTilesetTextureProvider.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/18/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPTilesetTextureProvider.h"
#import <SpriteKit/SpriteKit.h>

@interface TPTilesetTextureProvider ()

@property (nonatomic) NSMutableDictionary *tilesets;

@end

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

-(void)loadTilesets
{
    self.tilesets = [[NSMutableDictionary alloc] init];
    SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:@"Graphics"];
    
    // Get path to property list.
    NSString *plistpath = [[NSBundle mainBundle] pathForResource:@"TilesetGraphics" ofType:@"plist"];
    // Load contents of file.
    NSDictionary *tilesetList = [NSDictionary dictionaryWithContentsOfFile:plistpath];
    // Loop through tilesetList.
    for (NSString *tilesetKey in tilesetList) {
        // Get dictionary of texture names.
        NSDictionary *textureList = [tilesetList objectForKey:tilesetKey];
        // Create dictionary to hold textures.
        NSMutableDictionary *textures = [[NSMutableDictionary alloc] init];
        
        for (NSString *textureKey in textureList) {
            // Get texture for key.
            SKTexture *texture = [atlas textureNamed:[textureList objectForKey:textureKey]];
            // Insert texture to textures dictionary.
            [textures setObject:texture forKey:textureKey];
        }
        
        // Add textures dictionary to tilesets
        [self.tilesets setObject:textures forKey:tilesetKey];
    }
    
}

@end
