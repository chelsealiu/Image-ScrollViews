//
//  NewViewController.m
//  Image Scroll Views
//
//  Created by Chelsea Liu on 6/23/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "NewViewController.h"
#import "ViewController.h"

@interface NewViewController ()

@property (nonatomic, strong) UIImageView *tempImageView;

@end


@implementation NewViewController

-(void) viewDidLoad {

    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    self.scrollView.userInteractionEnabled = YES;
    

    

    self.tempImageView = [[UIImageView alloc] initWithImage:self.finalImage];

    
    [self.scrollView addSubview: self.tempImageView];
    

    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.tempImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.tempImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.tempImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:self.tempImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    self.finalImageView.contentMode = UIViewContentModeScaleAspectFit;

//    self.finalImageView.image = self.finalImage;
    
    [self viewForZoomingInScrollView:self.scrollView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIImageView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [self.scrollView.subviews firstObject];
}





@end
