//
//  ImageScanViewController.m
//  Timer
//
//  Created by lx on 16/5/24.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "ImageScanViewController.h"
#import "ImageScanCollectionView.h"

@interface ImageScanViewController ()

@end

@implementation ImageScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationController.navigationBarHidden = YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(dismiss)];
    
    [self createCollectionView];
    
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)createCollectionView{
    
    ImageScanCollectionView *collectionView = [[ImageScanCollectionView alloc] initWithFrame:self.view.bounds];
    
    NSLog(@"%@",NSStringFromCGRect(self.view.bounds));
    
    collectionView.dataList = _dataList;
    
    //视图创建以后，需要滑动到某个位置
    [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_index inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    [self.view addSubview:collectionView];
    
}


@end
