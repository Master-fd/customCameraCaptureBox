//
//  FDBottomBarView.m
//  customCameraCaptureBox
//
//  Created by asus on 16/7/27.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import "FDBottomBarView.h"
#import "Masonry.h"


@implementation FDBottomBarView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        __weak typeof(self) _weakSelf = self;
        
        //返回
        UIButton *backHomeBtn = [[UIButton alloc] init];
        [self addSubview:backHomeBtn];
        [backHomeBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backHomeBtn addTarget:self action:@selector(backHome:) forControlEvents:UIControlEventTouchUpInside];
        [backHomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_weakSelf).offset(10);
            make.bottom.equalTo(_weakSelf).offset(-10);
            make.leading.mas_equalTo(10);
            make.width.equalTo(@55);
        }];
        
        //拍照
        UIButton *takeCameraBtn = [[UIButton alloc] init];
        [self addSubview:takeCameraBtn];
        [takeCameraBtn setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        
        [takeCameraBtn addTarget:self action:@selector(takeCamera:) forControlEvents:UIControlEventTouchUpInside];
        [takeCameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_weakSelf).offset(-10);
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.centerX.mas_equalTo(_weakSelf.mas_centerX);
        }];
        

    }
    
    return self;
}

//返回
- (void)backHome:(UIButton *)sender
{
    if (self.backHomeBlock) {
        self.backHomeBlock(sender);
        
    }
}

//拍照
- (void)takeCamera:(UIButton *)sender
{
    if (self.takeCameraBlock) {
        self.takeCameraBlock(sender);
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
