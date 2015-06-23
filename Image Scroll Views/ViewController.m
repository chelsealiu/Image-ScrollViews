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

//@property (strong, nonatomic) UINavigationController *navigateToDetailView;

@property (strong, nonatomic) UIView *rootView;

@end


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidAppear:YES];

}

-(void) viewDidAppear:(BOOL)animated {
    
        self.scrollView.delegate = self;
    
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
            
            [self.rootView addSubview:imageView];
        }
    
        [self.scrollView addSubview:self.rootView];
        self.scrollView.contentSize = (CGSize){xPosition, self.scrollView.frame.size.height};
    
    }

- (IBAction)handleTapFrom:(id)sender {
    [self performSegueWithIdentifier: @"detailSegue" sender:sender];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
