//
//  FDEditImageView.m
//  customCameraCaptureBox
//
//  Created by asus on 16/7/10.
//  Copyright (c) 2016年 asus. All rights reserved.
//

#import "FDEditImageView.h"
#import "masonry.h"
#import "UIImage+cutImage.h"



@interface FDEditImageView()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *editView;

@end
@implementation FDEditImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSLog(@"编辑图片");
        
        __weak typeof(self) _weakSelf = self;
        
        self.imageView = [[UIImageView alloc] init];
        [self addSubview:self.imageView];
        self.imageView.backgroundColor = [UIColor redColor];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        //上工具bar
        
        UIView *topBar = [[UIView alloc] init];
        [self addSubview:topBar];
        topBar.backgroundColor = [UIColor blackColor];
        [topBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.leading.trailing.equalTo(_weakSelf);
            make.height.equalTo(@50);
        }];
        
        //下工具bar
        UIView *bottomBar = [[UIView alloc] init];
        [self addSubview:bottomBar];
        bottomBar.backgroundColor = [UIColor blackColor];
        [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.leading.and.trailing.equalTo(_weakSelf);
            make.height.equalTo(@50);
        }];
        
        //取消
        UIButton *cancelBtn = [[UIButton alloc] init];
        [bottomBar addSubview:cancelBtn];
        cancelBtn.backgroundColor = [UIColor orangeColor];
        [cancelBtn setTitle:@"确定" forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(confirmBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.right.and.bottom.equalTo(bottomBar);
            make.width.equalTo(@50);
        }];
        
        //确定
        UIButton *confirmBtn = [[UIButton alloc] init];
        [bottomBar addSubview:confirmBtn];
        confirmBtn.backgroundColor = [UIColor orangeColor];
        [confirmBtn setTitle:@"返回" forState:UIControlStateNormal];
        [confirmBtn addTarget:self action:@selector(cancelBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.leading.and.bottom.equalTo(bottomBar);
            make.width.equalTo(@50);
        }];
        
        //中间选择框
        self.editView = [[UIView alloc] init];
        self.editView.layer.masksToBounds = YES;
        self.editView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.editView];
        [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(topBar.mas_bottom);
            make.leading.and.trailing.equalTo(_weakSelf);
            make.bottom.equalTo(bottomBar.mas_top);
        }];
        
    }
    
    return self;
}

- (void)confirmBtnDidClick:(UIButton *)btn
{
    //将图片截成矩形图片
    CGFloat height = [UIScreen mainScreen].bounds.size.height - 100;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = 0;
    CGFloat y = (self.imageView.image.size.height - height)/2;
    UIImage *image = [UIImage clipImageWithImage:self.imageView.image inRect:CGRectMake(x, y, width, height)];
    if (self.editImageEndBlock) {
        self.editImageEndBlock(image);
    }
    
}

- (void)cancelBtnDidClick:(UIButton *)btn
{
    if (self.editImageCancelBlock) {
        self.editImageCancelBlock();
    }
}

- (void)setPhotoImage:(UIImage *)photoImage
{
    
    _photoImage =  photoImage;
    self.imageView.image = photoImage;
}



@end
