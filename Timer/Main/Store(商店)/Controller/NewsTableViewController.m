//
//  NewsTableViewController.m
//  Timer
//
//  Created by lx on 16/5/24.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "NewsTableViewController.h"
#import "ImageScanViewController.h"

@interface NewsTableViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *image;
@property (weak, nonatomic) IBOutlet UIView *imagesView;

@property (nonatomic, weak)UICollectionViewFlowLayout *layout;
@property (nonatomic, weak)UICollectionView *collection;
@property (nonatomic, assign, getter = isSelected)BOOL selected;

@property (nonatomic, strong)NSMutableArray *imageArray;

@end

@implementation NewsTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[UIStoryboard storyboardWithName:@"NewsViewStb" bundle:nil] instantiateInitialViewController];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCollectionView];
}

- (NSMutableArray *)imageArray{
    
    if (!_imageArray) {
        
        _imageArray = [NSMutableArray array];
        
        NSDictionary *dic = [CoreDataFromJson jsonObjectFromFileName:@"image_news"];
        NSArray *images = [dic objectForKey:@"images"];//图片
        for (NSDictionary *dic in images) {
            
            NSString *imageName = [dic objectForKey:@"url1"];
            
            [_imageArray addObject:imageName];
        }

    }
    return _imageArray;
}


- (void)setUpCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(80, 80);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _layout = layout;
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:self.imagesView.bounds collectionViewLayout:_layout];
    
    collection.delegate = self;
    collection.dataSource = self;
    collection.backgroundColor = [UIColor clearColor];
    collection.bounces = NO;
    collection.pagingEnabled = YES;
    
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collection = collection;
    [self.imagesView addSubview:_collection];
    
}


#pragma mark -UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 9;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    for (UIView *view in cell.subviews) {
        
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
        
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
    
    [imageView setImageWithURL:[NSURL URLWithString:self.imageArray[indexPath.item]]];
   
    [cell.contentView addSubview:imageView];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ImageScanViewController *imageScanVC = [[ImageScanViewController alloc] init];
    imageScanVC.dataList = _imageArray;
    imageScanVC.index = indexPath.item;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:imageScanVC];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
