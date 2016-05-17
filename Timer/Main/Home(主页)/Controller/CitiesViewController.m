//
//  CitiesViewController.m
//  Timer
//
//  Created by lx on 16/5/16.
//  Copyright © 2016年 LiZhiqiang. All rights reserved.
//

#import "CitiesViewController.h"
#import "CitiesCell.h"

@interface CitiesViewController () <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic, weak)UITextField *textField;
@property (nonatomic, weak)UICollectionView *collection;

@property (nonatomic, strong)NSMutableDictionary *sectionDic;
@property (nonatomic, strong)NSMutableArray *allKeyArray;
@property (nonatomic, strong)NSArray *allkey;
@property (nonatomic, strong)NSMutableArray *hotCities;
@property (nonatomic, strong)NSMutableArray *latestCities;

@end

@implementation CitiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //创建子视图
    [self setUpView];
    
    [self loadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextChange:) name:UITextFieldTextDidChangeNotification object:nil];
    
    
}

- (void)textFieldTextChange:(NSNotification *)notification{
    
    NSString *text = self.textField.text;
    NSString *str = [NSString stringWithFormat:@"SELF LIKE [C] '*%@*'",text];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:str];
    
    self.allKeyArray = [NSMutableArray arrayWithArray:[self.allkey filteredArrayUsingPredicate:predicate]];
    [self.collection reloadData];
    
}

- (NSArray *)allkey{
    
    if (!_allkey) {
        
        _allkey = [NSArray array];
        _allkey = _allKeyArray;
    }
    return _allkey;
}

- (NSMutableArray *)allKeyArray{
    
    if (!_allKeyArray) {
        
        NSArray *array = [[_sectionDic allKeys] sortedArrayUsingSelector:@selector(compare:)];
        
        _allKeyArray = [NSMutableArray arrayWithArray:array];
        
        //排序后热门城市和最近访问城市分别在倒数第一,二位.移动到前一二位.
        [_allKeyArray insertObject:_allKeyArray.lastObject atIndex:0];
        [_allKeyArray removeLastObject];
        [_allKeyArray insertObject:_allKeyArray.lastObject atIndex:1];
        [_allKeyArray removeLastObject];
        
    }
    return _allKeyArray;
}

/**
 *  创建子视图
 */
- (void)setUpView{
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    textField.borderStyle = UITextBorderStyleLine;
    textField.backgroundColor = [UIColor whiteColor];
    _textField = textField;
    [self.view addSubview:_textField];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.itemSize = CGSizeMake(100, 50);
    layout.headerReferenceSize = CGSizeMake(100, 50);
    
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 40, kScreenWidth, kScreenHeight - 40) collectionViewLayout:layout];
    _collection = collection;
    [self.view addSubview:collection];
    
    collection.delegate = self;
    collection.dataSource = self;
    
    collection.backgroundColor = [UIColor whiteColor];
    
    [collection registerClass:[CitiesCell class] forCellWithReuseIdentifier:@"cell"];
    [collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

/**
 *  加载数据
 */
- (void)loadData{
    
    NSDictionary *jsonDic = [CoreDataFromJson jsonObjectFromFileName:@"cities"];
    
    NSDictionary *infor = [jsonDic objectForKey:@"infor"];
    
    NSArray *listItems = [infor objectForKey:@"listItems"];
    
    _sectionDic = [NSMutableDictionary dictionary];
    
    //最近访问
    _latestCities = [[NSMutableArray alloc] init];
    
    //热门城市数组
    _hotCities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in listItems) {
     
        //获取城市首字母
        NSString *charindex = [dic objectForKey:@"charindex"];
        
        //sectionDic字典中没有该首字母开头的内容
        if ([_sectionDic objectForKey:charindex] == nil) {
            
            //字典中添加该首字母开头的城市数组
            
            NSMutableArray *array = [NSMutableArray array];
            
            [array addObject:[dic objectForKey:@"name"]];
         
            [_sectionDic setObject:array forKey:charindex];
        }else{
            
            //sectionDic字典中存在该首字母开头城市的数组
            
            //获取该数组
            NSMutableArray *array = [NSMutableArray array];
            
            array = [_sectionDic objectForKey:charindex];
            
            [array addObject:[dic objectForKey:@"name"]];
            
        }
        //为热门城市和最近访问城市分组
        if ([[dic objectForKey:@"level"] isEqualToString:@"1"]) {
            
            //热门城市
            [_hotCities addObject:[dic objectForKey:@"name"]];
            [_sectionDic setObject:_hotCities forKey:@"热门城市"];
            
        }
        
        if ([[dic objectForKey:@"nodepath"] isEqualToString:@"0"]) {
            
            //最近访问
            [_latestCities addObject:[dic objectForKey:@"name"]];
            [_sectionDic setObject:_latestCities forKey:@"最近访问城市"];
        }
    }
}

#pragma mark -UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.allKeyArray.count ;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    NSArray *array = [_sectionDic objectForKey:self.allKeyArray[section]];
    
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CitiesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *array = [_sectionDic objectForKey:self.allKeyArray[indexPath.section]];
    
    cell.cityLabel.text = array[indexPath.row];
    
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    header.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    
    //遍历cell的所有子视图,找到所有label,并删除label
    for (UIView *subView in header.subviews) {
        
        if ([subView isMemberOfClass:[UILabel class]]) {
            
            [subView removeFromSuperview];
        }
        
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:header.bounds];
    label.textAlignment = NSTextAlignmentCenter;

    [header addSubview:label];
    
    label.text = self.allKeyArray[indexPath.section];
    
    return header;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = [_sectionDic objectForKey:self.allKeyArray[indexPath.section]];
    
    _textField.text = array[indexPath.row];
    
    self.selectCity(array[indexPath.row]);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
