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
#import "FDTopBarView.h"
#import "FDBottomBarView.h"

@interface FDCameraViewController ()

@property (nonatomic, strong) FDTopBarView *topBar;
@property (nonatomic, strong) FDBottomBarView *bottomBar;

@end

@implementation FDCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    __weak typeof(self) _weakSelf = self;
    
    

    //上工具bar
    FDTopBarView *topBar = [[FDTopBarView alloc] init];
    [self.view addSubview:topBar];
    topBar.backgroundColor = [UIColor blackColor];
    topBar.height = self.topHeight;
    topBar.cameraSwitchBlock = ^(UIButton *sender){
        [_weakSelf swapFrontAndBackCameras:sender];
    };
    topBar.cameraTorchOnBlock = ^(UIButton *sender){
        [_weakSelf cameraTorchOn:sender];
    };
    [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.leading.and.trailing.equalTo(_weakSelf.view);
    }];
    self.topBar = topBar;
    
    //下工具bar
    FDBottomBarView *bottomBar = [[FDBottomBarView alloc] init];
    [self.view addSubview:bottomBar];
    bottomBar.backgroundColor = [UIColor blackColor];
    bottomBar.height = self.bottomHeight;
    bottomBar.backHomeBlock = ^(UIButton *sender){
        [_weakSelf backToHome:sender];
    };
    bottomBar.takeCameraBlock = ^(UIButton *sender){
        [_weakSelf takeThePic:sender];
    };
    [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.leading.and.trailing.equalTo(_weakSelf.view);
    }];
    self.bottomBar = bottomBar;
    
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

- (void)setTopHeight:(CGFloat)topHeight
{
    _topHeight = topHeight;
    self.topBar.height = topHeight;
}
- (void)setBottomHeight:(CGFloat)bottomHeight
{
    _bottomHeight = bottomHeight;
    self.bottomBar.height = bottomHeight;
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
    

    if (self.pickerController.cameraFlashMode != UIImagePickerControllerCameraFlashModeOn){
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
