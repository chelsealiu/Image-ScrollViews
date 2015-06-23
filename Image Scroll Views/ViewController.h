//
//  ViewController.h
//  Image Scroll Views
//
//  Created by Chelsea Liu on 6/23/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) UIImageView *imageView1;
@property (strong, nonatomic) UIImageView *imageView2;
@property (strong, nonatomic) UIImageView *imageView3;
@property (strong, nonatomic) UIImage *tappedImage;

- (void) viewDidAppear:(BOOL)animated;

@end

