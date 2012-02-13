//
//  UIButton+Curled.m
//  curledViews
//
//  Created by Ryan Kelly on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIButton+Curled.h"
#import "CurledViewBase.h"
#import "QuartzCore/QuartzCore.h"

// This category is based on code and information from Shakir Ali - http://intellidzine.blogspot.com/2011/07/uiimageview-curl-shadow-effect-using.html

@interface UIButton(private)
-(void)setImage:(UIImage*)image withBorderWidth:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset forState:(UIControlState)controlState;
@end


@implementation UIButton (Curled)


-(void)configureBorder:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset

{
    [self.layer setBorderWidth:borderWidth];
    [self setContentMode:UIViewContentModeCenter];
    [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOffset:CGSizeMake(0.0, 4.0)];
    [self.layer setShadowRadius:3.0];
    [self.layer setShadowOpacity:0.4];
    
    UIBezierPath* path = [CurledViewBase curlShadowPathWithShadowDepth:shadowDepth
                                         controlPointXOffset:controlPointXOffset
                                         controlPointYOffset:controlPointYOffset
                                                     forView:self];
    [self.layer setShadowPath:path.CGPath];
}

-(void)setImage:(UIImage*)image borderWidth:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset forState:(UIControlState)controlState
{
    self.backgroundColor = [UIColor lightGrayColor];
    
    // delegate to CurledViewBase
    [self configureBorder:borderWidth shadowDepth:shadowDepth controlPointXOffset:controlPointXOffset controlPointYOffset:controlPointYOffset];
    
    UIImage* scaledImage = [CurledViewBase rescaleImage:image forView:self];
    [self setImage:scaledImage forState:controlState];
}

@end