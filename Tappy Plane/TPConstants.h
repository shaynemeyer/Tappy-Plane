//
//  TPConstants.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/16/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPConstants : NSObject

extern const uint32_t kTPCategoryPlane;
extern const uint32_t kTPCategoryGround;
extern const uint32_t kTPCategoryCollectable;

extern NSString *const kTPKeyMountainUp;
extern NSString *const kTPKeyMountainDown;
extern NSString *const kTPKeyMountainUpAlternate;
extern NSString *const kTPKeyMountainDownAlternate;
extern NSString *const kTPKeyCollectableStar;

extern NSString *const kTPTilesetGrass;
extern NSString *const kTPTilesetDirt;
extern NSString *const kTPTilesetIce;
extern NSString *const kTPTilesetSnow;

@end
