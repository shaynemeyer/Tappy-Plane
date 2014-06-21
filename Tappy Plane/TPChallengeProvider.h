//
//  TPChallengeProvider.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/21/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPChallengeItem : NSObject

@property (nonatomic) NSString *obstacleKey;
@property (nonatomic) CGPoint position;

+(instancetype)challengeItemWithKey:(NSString*)key andPosition:(CGPoint)position;

@end

@interface TPChallengeProvider : NSObject

+(instancetype)getProvider;
-(NSArray*)getRandomChallenge;

@end
