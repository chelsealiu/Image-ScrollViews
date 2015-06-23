//
//  NewViewController.h
//  Image Scroll Views
//
//  Created by Chelsea Liu on 6/23/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (strong, nonatomic) UIImageView *imageView3;

- (UIImageView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;

@end
