//
//  FDEditImageView.h
//  customCameraCaptureBox
//
//  Created by asus on 16/7/10.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FDEditImageView : UIView

/**
 *  顶部和底部距离
 */
@property (nonatomic, assign) CGFloat topHeight;
@property (nonatomic, assign) CGFloat bottomHeight;

@property (nonatomic, strong) UIImage *photoImage;  //需要编辑的图片
@property (nonatomic, copy) void(^editImageEndBlock)(UIImage *image); //确定按钮
@property (nonatomic, copy) void(^editImageCancelBlock)();  //返回按钮

@end
