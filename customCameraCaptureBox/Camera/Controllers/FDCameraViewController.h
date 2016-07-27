//
//  FDCameraViewController.h
//  customCameraCaptureBox
//
//  Created by asus on 16/7/10.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FDCameraViewController : UIViewController


@property (nonatomic, strong) UIImagePickerController *pickerController;

@property (nonatomic, assign) CGFloat topHeight;
@property (nonatomic, assign) CGFloat bottomHeight;

@end
