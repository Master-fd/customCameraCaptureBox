//
//  FDCameraViewController.m
//  customCameraCaptureBox
//
//  Created by asus on 16/7/10.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import "FDCameraViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "Masonry.h"

@interface FDCameraViewController ()


@end

@implementation FDCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) _weakSelf = self;
    
    

//上工具bar
    
    UIView *topBar = [[UIView alloc] init];
    [self.view addSubview:topBar];
    topBar.backgroundColor = [UIColor blackColor];
    [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.trailing.equalTo(_weakSelf.view);
        make.height.equalTo(@50);
    }];
    //切换摄像头
    UIButton *changeCameraBtn = [[UIButton alloc] init];
    [topBar addSubview:changeCameraBtn];
    changeCameraBtn.backgroundColor = [UIColor orangeColor];
    [changeCameraBtn setTitle:@"切换摄像头" forState:UIControlStateNormal];
    [changeCameraBtn addTarget:self action:@selector(swapFrontAndBackCameras:) forControlEvents:UIControlEventTouchUpInside];
    [changeCameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.right.and.bottom.equalTo(topBar);
        make.width.equalTo(@120);
    }];
    //闪光灯
    UIButton *cameraFroceBtn = [[UIButton alloc] init];
    [topBar addSubview:cameraFroceBtn];
    cameraFroceBtn.backgroundColor = [UIColor orangeColor];
    [cameraFroceBtn setTitle:@"开闪光灯" forState:UIControlStateNormal];
    [cameraFroceBtn setTitle:@"关闪光灯" forState:UIControlStateSelected];
    [cameraFroceBtn addTarget:self action:@selector(cameraTorchOn:) forControlEvents:UIControlEventTouchUpInside];
    [cameraFroceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.and.bottom.equalTo(topBar);
        make.width.equalTo(@120);
    }];
    
//下工具bar
    UIView *bottomBar = [[UIView alloc] init];
    [self.view addSubview:bottomBar];
    bottomBar.backgroundColor = [UIColor blackColor];
    [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.leading.and.trailing.equalTo(_weakSelf.view);
        make.height.equalTo(@50);
    }];
    
    //拍照
    UIButton *takeCameraBtn = [[UIButton alloc] init];
    [bottomBar addSubview:takeCameraBtn];
    takeCameraBtn.backgroundColor = [UIColor orangeColor];
    [takeCameraBtn setTitle:@"拍照" forState:UIControlStateNormal];
    [takeCameraBtn addTarget:self action:@selector(takeThePic:) forControlEvents:UIControlEventTouchUpInside];
    [takeCameraBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(bottomBar);
        make.centerX.equalTo(topBar);
        make.width.equalTo(@50);
    }];
    
    //返回
    UIButton *backHomeBtn = [[UIButton alloc] init];
    [bottomBar addSubview:backHomeBtn];
    backHomeBtn.backgroundColor = [UIColor orangeColor];
    [backHomeBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backHomeBtn addTarget:self action:@selector(backToHome:) forControlEvents:UIControlEventTouchUpInside];
    [backHomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.and.bottom.equalTo(bottomBar);
        make.width.equalTo(@50);
    }];
    
//中间阴影
    UIView *shadowView = [[UIView alloc] init];
    shadowView.backgroundColor = [UIColor grayColor];
    shadowView.alpha = 0.1;
    [self.view addSubview:shadowView];
    [self.view sendSubviewToBack:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topBar.mas_bottom);
        make.bottom.equalTo(bottomBar.mas_top);
        make.leading.and.trailing.equalTo(_weakSelf.view);
    }];
}


//拍摄照片

-(void)takeThePic:(id)sender{
    
    [self.pickerController takePicture];
    
}


-(void)backToHome:(id)sender{
    
    [self.pickerController dismissViewControllerAnimated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backToHome" object:nil];
    
}

//闪光灯

-(void)cameraTorchOn:(UIButton *)sender{
    
    
    if (self.pickerController.cameraFlashMode ==UIImagePickerControllerCameraFlashModeAuto) {
        
        self.pickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeOn;
        sender.selected = YES;
    }else {
        
        self.pickerController.cameraFlashMode = UIImagePickerControllerCameraFlashModeOff;
        sender.selected = NO;
    }
    
}


//前后摄像头

- (void)swapFrontAndBackCameras:(id)sender {
    
    if (self.pickerController.cameraDevice ==UIImagePickerControllerCameraDeviceRear ) {
        
        self.pickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
    }else {
        
        self.pickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        
    }
    
}

@end
