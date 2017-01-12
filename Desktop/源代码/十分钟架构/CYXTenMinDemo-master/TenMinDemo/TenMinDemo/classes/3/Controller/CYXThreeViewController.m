//
//  CYXThreeViewController.m
//  
//
//  Created by Macx on 15/9/4.
//  Copyright (c) 2015年 CYX. All rights reserved.
//  分类控制器

#import "CYXThreeViewController.h"
#import <objc/runtime.h>

#import "CYXMenu.h"
@interface CYXThreeViewController ()

@end

@implementation CYXThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    // runtime 遍历类中所有属性
    // 获得所有的成员变量
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList([UIPageControl class], &outCount);
    
    // 遍历所有的成员变量
    for (int i = 0; i < outCount; i++) {
        // 获得第i个成员变量
        Ivar ivar = ivarList[i];
        
        // 获得成员变量的名称和类型
        NSLog(@"%@ -> %s = %s", [UIPageControl class], ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    // 释放资源
    free(ivarList);

    /*
     // 打印结果----http://www.jianshu.com/p/fbd1e7c93fd0
     2017-01-11 13:54:47.338 TenMinDemo[1146:747651] UIPageControl -> _lastUserInterfaceIdiom = i
     2017-01-11 13:54:47.339 TenMinDemo[1146:747651] UIPageControl -> _indicators = @"NSMutableArray"
     2017-01-11 13:54:47.339 TenMinDemo[1146:747651] UIPageControl -> _currentPage = i
     2017-01-11 13:54:47.339 TenMinDemo[1146:747651] UIPageControl -> _displayedPage = i
     2017-01-11 13:54:47.339 TenMinDemo[1146:747651] UIPageControl -> _pageControlFlags = {?="hideForSinglePage"b1"defersCurrentPageDisplay"b1}
     2017-01-11 13:54:47.340 TenMinDemo[1146:747651] UIPageControl -> _currentPageImage = @"UIImage"
     2017-01-11 13:54:47.340 TenMinDemo[1146:747651] UIPageControl -> _pageImage = @"UIImage"
     2017-01-11 13:54:47.340 TenMinDemo[1146:747651] UIPageControl -> _currentPageImages = @"NSMutableArray"
     2017-01-11 13:54:47.340 TenMinDemo[1146:747651] UIPageControl -> _pageImages = @"NSMutableArray"
     2017-01-11 13:54:47.340 TenMinDemo[1146:747651] UIPageControl -> _backgroundVisualEffectView = @"UIVisualEffectView"
     2017-01-11 13:54:47.341 TenMinDemo[1146:747651] UIPageControl -> _currentPageIndicatorTintColor = @"UIColor"
     2017-01-11 13:54:47.341 TenMinDemo[1146:747651] UIPageControl -> _pageIndicatorTintColor = @"UIColor"
     2017-01-11 13:54:47.341 TenMinDemo[1146:747651] UIPageControl -> _legibilitySettings = @"_UILegibilitySettings"
     2017-01-11 13:54:47.341 TenMinDemo[1146:747651] UIPageControl -> _numberOfPages = i

     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
