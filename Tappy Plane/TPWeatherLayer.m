//
//  TPWeatherLayer.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/26/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPWeatherLayer.h"
#import "SoundManager.h"

@interface TPWeatherLayer()

@property (nonatomic) SKEmitterNode *rainEmitter;
@property (nonatomic) SKEmitterNode *snowEmitter;
@property (nonatomic) Sound *rainSound;

@end

@implementation TPWeatherLayer

- (instancetype)initWithSize:(CGSize)size
{
    self = [super init];
    if (self) {
        _size = size;
        
        // Load rain effect.
        NSString *rainEffectPath = [[NSBundle mainBundle] pathForResource:@"RainEffect" ofType:@"sks"];
        _rainEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:rainEffectPath];
        _rainEmitter.position = CGPointMake(size.width * 0.5 + 32, size.height + 5);
        
        // Setup rain sound.
        _rainSound = [Sound soundNamed:@"Rain.caf"];
        _rainSound.looping = YES;
        
        // Load snow effect.
        NSString *snowEffectPath = [[NSBundle mainBundle] pathForResource:@"SnowEffect" ofType:@"sks"];
        _snowEmitter = [NSKeyedUnarchiver unarchiveObjectWithFile:snowEffectPath];
        _snowEmitter.position = CGPointMake(size.width * 0.5, size.height + 5);
    }
    return self;
}

-(void)setConditions:(WeatherType)conditions
{
    if (_conditions != conditions) {
        _conditions = conditions;
        // Remove existing weather effect.
        [self removeAllChildren];
        
        // Stop any existing sounds from playing.
        if (self.rainSound.playing) {
            [self.rainSound fadeOut:1.0];
        }
        
        // Add weather conditions.
        switch (conditions) {
            case WeatherRaining:
                [self.rainSound play];
                [self.rainSound fadeIn:1.0];
                [self addChild:self.rainEmitter];
                // make the scene already be raining by advancing the simulation.
                [self.rainEmitter advanceSimulationTime:5];
               
                break;
            case WeatherSnowing:
                [self addChild:self.snowEmitter];
                // make the scene already be snowing by advancing the simulation.
                [self.snowEmitter advanceSimulationTime:5];
                break;
            default:
                break;
        }
    }
}

@end
