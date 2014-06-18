//
//  TPBitmapFontLabel.m
//  Tappy Plane
//
//  Created by Shayne Meyer on 6/17/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

#import "TPBitmapFontLabel.h"

@implementation TPBitmapFontLabel

-(instancetype)initWithText:(NSString*)text andFontName:(NSString*)fontName
{
    if (self = [self init]) {
        _text = text;
        _fontName = fontName;
        _letterSpacing = 2.0;
        [self updateText];
    }
    return self;
}

-(void)setText:(NSString *)text
{
    if (_text != text) {
        _text = text;
        [self updateText];
    }
}

-(void)setFontName:(NSString *)fontName
{
    if (_fontName != fontName) {
        _fontName = fontName;
        [self updateText];
    }
}

-(void)setLetterSpacing:(CGFloat)letterSpacing
{
    if (_letterSpacing != letterSpacing) {
        _letterSpacing = letterSpacing;
        [self updateText];
    }
}

-(void)updateText
{
    
}

@end
