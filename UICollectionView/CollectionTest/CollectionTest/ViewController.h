//
//  ViewController.h
//  CollectionTest
//
//  Created by User on 13-5-7.
//  Copyright (c) 2013年 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
   IBOutlet UICollectionView *collectionView;
   IBOutlet UICollectionReusableView *footView;
}

@end
