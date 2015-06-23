//
//  NewViewController.m
//  Image Scroll Views
//
//  Created by Chelsea Liu on 6/23/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIImageView *currentImage;


@end


@implementation NewViewController



-(void) viewDidAppear:(BOOL)animated {
    
    self.scrollView.delegate = self;
    
    self.imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    self.imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];
    self.imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
 
 
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){xPosition,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height}];
//        imageView.image = image;
    
        [self.scrollView addSubview:imageView];
    
//    self.scrollView.contentSize = (CGSize){xPosition, self.scrollView.frame.size.height};
    [self viewForZoomingInScrollView:self.scrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (UIImageView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [self.scrollView.subviews firstObject];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NewViewController *detailVC = [segue destinationViewController];
    
    detailVC.currentImage = self.imageView1;
    
    
}




@end
