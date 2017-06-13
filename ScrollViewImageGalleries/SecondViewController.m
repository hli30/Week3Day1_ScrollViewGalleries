//
//  SecondViewController.m
//  ScrollViewImageGalleries
//
//  Created by Harry Li on 2017-06-12.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *secondScrollView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondScrollView.minimumZoomScale = 1.0;
    self.secondScrollView.maximumZoomScale = 3.0;
    self.imageView.image = self.pictureView;
    self.secondScrollView.zoomScale = 1.0;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


@end
