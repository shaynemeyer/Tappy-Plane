//
//  TPChallengeProvider.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/21/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPChallengeProvider.h"
#import "TPConstants.h"

@implementation TPChallengeItem

+(instancetype)challengeItemWithKey:(NSString*)key andPosition:(CGPoint)position
{
    TPChallengeItem *item = [[TPChallengeItem alloc] init];
    item.obstacleKey = key;
    item.position = position;
    return item;
}

@end

@interface TPChallengeProvider()

@property (nonatomic) NSMutableArray *challenges;

@end

@implementation TPChallengeProvider

+(instancetype)getProvider
{
    static TPChallengeProvider *sharedInstance = nil;
    @synchronized(self){
        if (!sharedInstance) {
            sharedInstance = [[TPChallengeProvider alloc] init];
        }
    }
    return sharedInstance;
}

-(NSArray*)getRandomChallenge
{
    return [self.challenges objectAtIndex:arc4random_uniform((uint)self.challenges.count)];
}

-(void)loadChallenges
{
    _challenges = [NSMutableArray array];
    
    // Challenge 1
    NSMutableArray *challenge = [NSMutableArray array];
    [challenge addObject:[TPChallengeItem challengeItemWithKey:kTPKeyMountainUp andPosition:CGPointMake(0, 0)]];
    [self.challenges addObject:challenge];
    
    // Challenge 2
    challenge = [NSMutableArray array];
    [challenge addObject:[TPChallengeItem challengeItemWithKey:kTPKeyMountainUp andPosition:CGPointMake(0, 0)]];
    [self.challenges addObject:challenge];
}

@end
