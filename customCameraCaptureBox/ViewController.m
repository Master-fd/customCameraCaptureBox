//
//  ViewController.m
//  customCameraCaptureBox
//
//  Created by asus on 16/7/10.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import "ViewController.h"
#import "FDCameraViewController.h"
#import "FDEditImageView.h"
#import "UIImage+cutImage.h"


#define kTopBarHeight    44
#define kBottomBarHeight  85

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (nonatomic, strong) FDCameraViewController *cameraViewController;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) FDEditImageView *editView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 40, 200, 50)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"拍照" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 320, 380)];
    [self.view addSubview:self.imageView];
    self.imageView.backgroundColor = [UIColor redColor];
    
    CGRect rect = self.view.frame;
    self.editView = [[FDEditImageView alloc] initWithFrame:rect];
    [self.view addSubview:self.editView];
    self.editView.hidden = YES;
    self.editView.topHeight = kTopBarHeight;
    self.editView.bottomHeight = kBottomBarHeight;
}


- (void)btnDidClick
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.showsCameraControls = NO;
    imagePickerController.navigationBarHidden = YES;
    imagePickerController.allowsEditing = NO;

    
    self.cameraViewController = [[FDCameraViewController alloc] init];
    self.cameraViewController.topHeight = kTopBarHeight;
    self.cameraViewController.bottomHeight = kBottomBarHeight;
    imagePickerController.cameraOverlayView = self.cameraViewController.view;
    self.cameraViewController.pickerController = imagePickerController;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
    

    
}





#pragma mark - 代理方法

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
   
    UIImage* image = [info valueForKey:UIImagePickerControllerOriginalImage];

    __weak typeof(self) _weakSelf = self;
    
    //编辑图片
    NSLog(@"在这里可以添加一个编辑图片的控制器或者view  %@", info);
    self.editView.hidden = NO;
    self.editView.photoImage = [UIImage reSizeImage:image toSize:[UIScreen mainScreen].bounds.size];  //先从定义大小，在赋值
    self.editView.editImageCancelBlock = ^{
        _weakSelf.editView.hidden = YES;
        [_weakSelf btnDidClick];  //返回按钮，继续拍照
    };
    self.editView.editImageEndBlock = ^(UIImage *image){
        _weakSelf.editView.hidden = YES;
        _weakSelf.imageView.image = image; //图片编辑完之后回调
    };
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
