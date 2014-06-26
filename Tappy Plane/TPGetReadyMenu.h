//
//  TPGetReadyMenu.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/26/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TPGetReadyMenu : SKNode

@property (nonatomic) CGSize size;

-(instancetype)initWithSize:(CGSize)size andPlanePosition:(CGPoint)planPosition;

-(void)show;
-(void)hide;

@end
