//
//  FDTopBarView.m
//  customCameraCaptureBox
//
//  Created by asus on 16/7/27.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import "FDTopBarView.h"
#import "Masonry.h"

@implementation FDTopBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        __weak typeof(self) _weakSelf = self;
        
        //闪光灯
        UIButton *cameraFroceBtn = [[UIButton alloc] init];
        [self addSubview:cameraFroceBtn];
        [cameraFroceBtn setImage:[UIImage imageNamed:@"camera_flash_off"] forState:UIControlStateNormal];
        [cameraFroceBtn setImage:[UIImage imageNamed:@"camera_flash_on"] forState:UIControlStateSelected];
        
        [cameraFroceBtn addTarget:self action:@selector(cameraTorchOn:) forControlEvents:UIControlEventTouchUpInside];
        [cameraFroceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_weakSelf).offset(10);
            make.bottom.equalTo(_weakSelf).offset(-10);
            make.leading.mas_equalTo(10);
            make.width.equalTo(@55);
        }];
        
        //切换摄像头
        UIButton *changeCameraBtn = [[UIButton alloc] init];
        [self addSubview:changeCameraBtn];
        [changeCameraBtn setImage:[UIImage imageNamed:@"camera_swap"] forState:UIControlStateNormal];
        
        [changeCameraBtn addTarget:self action:@selector(cameraSwitch:) forControlEvents:UIControlEventTouchUpInside];
        [changeCameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_weakSelf).offset(10);
            make.bottom.equalTo(_weakSelf).offset(-10);
            make.trailing.mas_equalTo(-10);
            make.width.equalTo(@55);
        }];
        
       
    }
    
    return self;
}

//闪光灯

- (void)cameraTorchOn:(UIButton *)sender
{
    if (self.cameraTorchOnBlock) {
        self.cameraTorchOnBlock(sender);
        
    }
}

//切换摄像头
- (void)cameraSwitch:(UIButton *)sender
{
    if (self.cameraSwitchBlock) {
        self.cameraSwitchBlock(sender);
    }
}

- (void)setHeight:(CGFloat)height
{
    _height = height;
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    
}

@end
