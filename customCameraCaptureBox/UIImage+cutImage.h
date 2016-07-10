//
//  UIImage+cutImage.h
//  圆形裁剪框
//
//  Created by 廖晓帆 on 16/5/20.
//  Copyright © 2016年 廖晓帆. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (cutImage)

//自定义大小
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

//将图片裁剪
+ (UIImage*)clipImageWithImage:(UIImage*)image inRect:(CGRect)rect;

@end
