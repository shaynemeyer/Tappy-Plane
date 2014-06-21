//
//  TPButton.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/21/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPButton.h"

@implementation TPButton

+(instancetype)spriteNodeWithTexture:(SKTexture *)texture
{
    TPButton *instance = [super spriteNodeWithTexture:texture];
    instance.pressedScale = 0.9;
    instance.userInteractionEnabled = YES;
    return instance;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
