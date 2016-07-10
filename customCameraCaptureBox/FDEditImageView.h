//
//  FDEditImageView.h
//  customCameraCaptureBox
//
//  Created by asus on 16/7/10.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDEditImageView : UIView

@property (nonatomic, strong) UIImage *photoImage;

@property (nonatomic, copy) void(^editImageEndBlock)(UIImage *image);

@property (nonatomic, copy) void(^editImageCancelBlock)();

@end
