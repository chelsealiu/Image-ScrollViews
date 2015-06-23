//
//  ViewController.m
//  Image Scroll Views
//
//  Created by Chelsea Liu on 6/23/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIView *rootView;

@property (strong, nonatomic) UIImage *tempImage;

@property (weak, nonatomic) IBOutlet UIPageControl *pageScroll;




@end


@implementation ViewController


- (IBAction)handleTapFrom:(UITapGestureRecognizer*)sender {
    
    
    
    int offset = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    if (offset < 1) {
        self.tempImage = self.imageView1.image;
        
    } else if (offset >= 1 && offset < 2) {
        self.tempImage = self.imageView2.image;
        
    } else {
        self.tempImage = self.imageView3.image;
    }
    
    [self performSegueWithIdentifier: @"detailSegue" sender:self.tempImage];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        NewViewController *tempVC = segue.destinationViewController;
        tempVC.finalImage = self.tempImage;
    }

}

- (void)viewDidLoad {
    
    [super viewDidAppear:YES];

}

-(void) viewDidAppear:(BOOL)animated {
    
        self.scrollView.delegate = self;
    
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    
        self.rootView = [[UIView alloc] init];
    
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView1.image = [UIImage imageNamed:@"Lighthouse-in-Field.jpg"];
        self.imageView1.contentMode = UIViewContentModeScaleAspectFill;

        self.imageView2 = [[UIImageView alloc] init];
        self.imageView2.image = [UIImage imageNamed:@"Lighthouse.jpg"];
        self.imageView2.contentMode = UIViewContentModeScaleAspectFill;
    
        self.imageView3 = [[UIImageView alloc] init];
        self.imageView3.image = [UIImage imageNamed:@"Lighthouse-night.jpg"];
        self.imageView3.contentMode = UIViewContentModeScaleAspectFill;
    
       NSArray *imageViewArray = @[self.imageView1.image, self.imageView2.image, self.imageView3.image];
        CGFloat xPosition = 0;
        
        for (UIImage *image in imageViewArray) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){xPosition,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height}];
            xPosition += self.scrollView.frame.size.width;
            imageView.image = image;
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.rootView addSubview:imageView];
        }
    
        [self.scrollView addSubview:self.rootView];
        self.scrollView.contentSize = (CGSize){xPosition, self.scrollView.frame.size.height};
    
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    int offset = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    if (offset < 1) {
        self.pageScroll.currentPage = 0;
    } else if (offset >= 1 && offset < 2) {
        self.pageScroll.currentPage = 1;
    } else {
        self.pageScroll.currentPage = 2;
    }

    
    
    
    
}


@end
