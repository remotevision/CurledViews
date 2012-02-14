//
//  CurledViewBase.m
//  curledViews
//
//  Created by Ryan Kelly on 2/9/12.
//  Copyright (c) 2012 Remote Vision, Inc. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this 
// file except in compliance with the License. You may obtain a copy of the License at 
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software distributed under
// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF 
// ANY KIND, either express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "CurledViewBase.h"
#import <QuartzCore/QuartzCore.h>

@implementation CurledViewBase


+(UIImage*)rescaleImage:(UIImage*)image forView:(UIView*)view {
    UIImage* scaledImage = image;
    
    CALayer* layer = view.layer;
    CGFloat borderWidth = layer.borderWidth;
    
    //if border is defined 
    if (borderWidth > 0)
    {
        //rectangle in which we want to draw the image.
        CGRect imageRect = CGRectMake(0.0, 0.0, view.bounds.size.width - 2 * borderWidth,view.bounds.size.height - 2 * borderWidth);
        
        //Only draw image if its size is bigger than the image rect size.
        if (image.size.width > imageRect.size.width || image.size.height > imageRect.size.height)
        {
            UIGraphicsBeginImageContext(imageRect.size);
            [image drawInRect:imageRect];
            scaledImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }        
    }
    return scaledImage;
}


+(UIBezierPath*)curlShadowPathWithShadowDepth:(CGFloat)shadowDepth controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset forView:(UIView*)view
{
    
    CGSize viewSize = [view bounds].size;
    CGPoint polyTopLeft = CGPointMake(0.0, controlPointYOffset);
    CGPoint polyTopRight = CGPointMake(viewSize.width, controlPointYOffset);
    CGPoint polyBottomLeft = CGPointMake(0.0, viewSize.height + shadowDepth);
    CGPoint polyBottomRight = CGPointMake(viewSize.width, viewSize.height +  shadowDepth);
    
    CGPoint controlPointLeft = CGPointMake(controlPointXOffset , controlPointYOffset);
    CGPoint controlPointRight = CGPointMake(viewSize.width - controlPointXOffset,  controlPointYOffset);
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    [path moveToPoint:polyTopLeft];
    [path addLineToPoint:polyTopRight];
    [path addLineToPoint:polyBottomRight];
    [path addCurveToPoint:polyBottomLeft 
            controlPoint1:controlPointRight
            controlPoint2:controlPointLeft];
    
    [path closePath];  
    return path;
}




@end
