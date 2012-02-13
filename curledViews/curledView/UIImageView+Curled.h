//
//  UIImageView+Curled.h
//  curledViews
//
//  Created by Ryan Kelly on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Curled)
-(void)setImage:(UIImage*)image borderWidth:(CGFloat)borderWidth shadowDepth:(CGFloat)shadowHeight controlPointXOffset:(CGFloat)controlPointXOffset controlPointYOffset:(CGFloat)controlPointYOffset;
@end
