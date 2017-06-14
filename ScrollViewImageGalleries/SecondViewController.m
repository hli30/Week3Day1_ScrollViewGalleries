//
//  SecondViewController.m
//  ScrollViewImageGalleries
//
//  Created by Harry Li on 2017-06-12.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *secondScrollView;
@property (nonatomic) UIImageView *imageView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupImageView];
    
    self.secondScrollView.minimumZoomScale = 1.0;
    self.secondScrollView.maximumZoomScale = 3.0;
    self.imageView.image = self.picture;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


-(void)setupImageView{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.picture];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.userInteractionEnabled = YES;
    
    self.imageView = imageView;
    
    [self.secondScrollView addSubview:imageView];
    
    NSLayoutConstraint *imageCenterConstraintX = [NSLayoutConstraint constraintWithItem:imageView
                                                                              attribute:NSLayoutAttributeCenterX
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.secondScrollView
                                                                              attribute:NSLayoutAttributeCenterX
                                                                             multiplier:1.0
                                                                               constant:0.0];
    imageCenterConstraintX.active = YES;
    
    NSLayoutConstraint *imageCenterConstraintY = [NSLayoutConstraint constraintWithItem:imageView
                                                                              attribute:NSLayoutAttributeCenterY
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.secondScrollView
                                                                              attribute:NSLayoutAttributeCenterY
                                                                             multiplier:1.0
                                                                               constant:0.0];
    imageCenterConstraintY.active = YES;
    
    NSLayoutConstraint *imageTopConstraint = [NSLayoutConstraint constraintWithItem:imageView
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.secondScrollView
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                           constant:0.0];
    imageTopConstraint.active = YES;
    
    NSLayoutConstraint *imageLeftConstraint = [NSLayoutConstraint constraintWithItem:imageView
                                                                            attribute:NSLayoutAttributeLeading
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.secondScrollView
                                                                            attribute:NSLayoutAttributeLeading
                                                                           multiplier:1.0
                                                                            constant:0.0];
    
    imageLeftConstraint.active = YES;
}
@end
