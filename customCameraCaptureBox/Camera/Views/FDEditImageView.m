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

@property (nonatomic, strong) UIView *topBar;
@property (nonatomic, strong) UIView *bottomBar;

@end
@implementation FDEditImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        __weak typeof(self) _weakSelf = self;
        
        self.imageView = [[UIImageView alloc] init];
        [self addSubview:self.imageView];
        self.imageView.backgroundColor = [UIColor redColor];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        //上工具bar
        self.topBar = [[UIView alloc] init];
        [self addSubview:self.topBar];
        self.topBar.backgroundColor = [UIColor blackColor];
        [self.topBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.leading.trailing.equalTo(_weakSelf);
            make.height.mas_equalTo(_weakSelf.topHeight);
        }];
        
        //下工具bar
        self.bottomBar = [[UIView alloc] init];
        [self addSubview:self.bottomBar];
        self.bottomBar.backgroundColor = [UIColor blackColor];
        [self.bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.leading.and.trailing.equalTo(_weakSelf);
            make.height.mas_equalTo(_weakSelf.bottomHeight);
        }];
        
        //取消
        UIButton *cancelBtn = [[UIButton alloc] init];
        [self.bottomBar addSubview:cancelBtn];
        [cancelBtn setTitle:@"返回" forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancelBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_weakSelf.bottomBar).offset(10);
            make.bottom.equalTo(_weakSelf.bottomBar).offset(-10);
            make.leading.mas_equalTo(10);
            make.width.mas_equalTo(55);
        }];
        
        //确定
        UIButton *confirmBtn = [[UIButton alloc] init];
        [self.bottomBar addSubview:confirmBtn];
        [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [confirmBtn addTarget:self action:@selector(confirmBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_weakSelf.bottomBar).offset(10);
            make.bottom.equalTo(_weakSelf.bottomBar).offset(-10);
            make.trailing.mas_equalTo(-10);
            make.width.mas_equalTo(@55);
        }];
        
        //中间选择框
        self.editView = [[UIView alloc] init];
        self.editView.layer.masksToBounds = YES;
        self.editView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.editView];
        [self.editView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_weakSelf.topBar.mas_bottom);
            make.leading.and.trailing.equalTo(_weakSelf);
            make.bottom.equalTo(_weakSelf.bottomBar.mas_top);
        }];
        
        
    }
    
    return self;
}

- (void)confirmBtnDidClick:(UIButton *)btn
{
    //将图片截成矩形图片
    CGFloat height = [UIScreen mainScreen].bounds.size.height - self.topHeight- self.bottomHeight;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat x = 0;
    CGFloat y = self.topHeight;
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

- (void)setTopHeight:(CGFloat)topHeight
{
    _topHeight = topHeight;
    [self.topBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(topHeight);
    }];
}

- (void)setBottomHeight:(CGFloat)bottomHeight
{
    _bottomHeight = bottomHeight;
    [self.bottomBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(bottomHeight);
    }];
    
}

@end
