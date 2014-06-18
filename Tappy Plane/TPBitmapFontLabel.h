//
//  TPBitmapFontLabel.h
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/17/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TPBitmapFontLabel : SKNode

@property (nonatomic) NSString *fontName;
@property (nonatomic) NSString *text;
@property (nonatomic) CGFloat letterSpacing;

-(instancetype)initWithText:(NSString*)text andFontName:(NSString*)fontName;

@end
