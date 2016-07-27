//
//  FDTopBarView.h
//  customCameraCaptureBox
//
//  Created by asus on 16/7/27.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^btnDidClick)(id sender);

@interface FDTopBarView : UIView

@property (nonatomic, copy) btnDidClick cameraTorchOnBlock;
@property (nonatomic, copy) btnDidClick cameraSwitchBlock;

@property (nonatomic, assign) CGFloat height;


@end
