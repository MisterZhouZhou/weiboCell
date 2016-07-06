//
//  UIImage+ZWImage.m
//  ZW微博
//
//  Created by rayootech on 16/2/6.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "UIImage+ZWImage.h"

@implementation UIImage (ZWImage)
+(instancetype)imageWithStretchableName:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    int leftCap = image.size.width * 0.5;
    int topCap = image.size.height * 0.5;
    return [image stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}
@end
