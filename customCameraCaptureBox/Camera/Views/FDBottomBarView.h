//
//  FDBottomBarView.h
//  customCameraCaptureBox
//
//  Created by asus on 16/7/27.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnDidClick)(id sender);

@interface FDBottomBarView : UIView

@property (nonatomic, copy) btnDidClick backHomeBlock;
@property (nonatomic, copy) btnDidClick takeCameraBlock;

@property (nonatomic, assign) CGFloat height;

@end
