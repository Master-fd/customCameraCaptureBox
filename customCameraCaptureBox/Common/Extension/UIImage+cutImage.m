//
//  UIImage+cutImage.m
//  圆形裁剪框
//
//  Created by 廖晓帆 on 16/5/20.
//  Copyright © 2016年 廖晓帆. All rights reserved.
//

#import "UIImage+cutImage.h"

@implementation UIImage (cutImage)




+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    FDLog(@"%@", NSStringFromCGSize(reSize));
   
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return reSizeImage;
}



+ (UIImage*)clipImageWithImage:(UIImage*)image inRect:(CGRect)rect
{
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);  //根据rect从image中获取图片
    
    UIGraphicsBeginImageContext(image.size);//开启一个上下文
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, rect, imageRef);  //将图片绘制到上下文中的rect位置
    
    UIImage* clipImage = [UIImage imageWithCGImage:imageRef];// 获取图片
   
    UIGraphicsEndImageContext();

    FDLog(@"%@", NSStringFromCGSize(clipImage.size));
    return clipImage;
    
}


@end
