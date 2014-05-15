//
//  ViewController.m
//  CollectionTest
//
//  Created by User on 13-5-7.
//  Copyright (c) 2013年 User. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    [collectionView registerClass:[UILabel class] forSupplementaryViewOfKind:@"Supplementary" withReuseIdentifier:@"Supplementary"];
   
//    UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
//    collectionView.collectionViewLayout = layout;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
//    每个item的大小
    layout.itemSize = CGSizeMake(30, 30);
    
    //每行的间距
    layout.minimumLineSpacing = 40.0;
    
    //每行内部cell item的间距
    layout. minimumInteritemSpacing = 40.0;
    
    //页眉和页脚的size配置
    layout.headerReferenceSize = CGSizeMake(320, 20);
    layout.footerReferenceSize = CGSizeMake(320, 20);
    
//    Section Inset
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
     layout.scrollDirection = UICollectionViewScrollDirectionVertical;
 
    collectionView.collectionViewLayout = layout;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark UICollectionViewDataSource 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)theCollectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *identifier =[[NSString alloc] initWithFormat: @"Cell"];
    UICollectionViewCell *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc] init];
    }
    [cell setBackgroundColor:[UIColor grayColor]];
    [cell.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [cell.layer setShadowOffset:CGSizeMake(0, 1)];
    [cell.layer setShadowOpacity:0.4];
    [cell.layer setShadowPath:CGPathCreateWithRect(cell.bounds, NULL)];
    
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionFooter) {
        reusableview = footView;
    }
    return reusableview;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//           viewForSupplementaryElementOfKind:(NSString *)kind
//                                 atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionReusableView *reusableview = nil;
//    
//    if (kind == UICollectionElementKindSectionFooter) {
//        reusableview = footView;
//    }
//    
//    return reusableview;
//}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didHighlightItemAtIndexPath");
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didUnhighlightItemAtIndexPath");
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str =[[NSString alloc] initWithFormat:@"%d",[indexPath row]];
    NSLog(@"=====%@",str);
    NSLog(@"didSelectItemAtIndexPath");
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didDeselectItemAtIndexPath");
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didEndDisplayingCell");
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didEndDisplayingSupplementaryView");
}


- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    NSLog(@"performAction");
}

@end
