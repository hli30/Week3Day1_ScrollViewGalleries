//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Harry Li on 2017-06-12.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) UIImageView *view1;
@property (nonatomic) UIImageView *view2;
@property (nonatomic) UIImageView *view3;

@property (nonatomic) UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupImage];
    [self setupPageControl];
    [self setupGestures];
}

-(void)viewTapped:(UITapGestureRecognizer *)sender {
    if ([sender.view isKindOfClass:[UIImageView class]]) {
        UIImageView * imageView = (UIImageView *)sender.view;
        UIImage * image = imageView.image;
        [self performSegueWithIdentifier:@"showDetail" sender:image];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        UIImage * image = (UIImage *)sender;
        SecondViewController * viewController = segue.destinationViewController;
        viewController.picture = image;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page;
}


#pragma mark -- Setup

- (void)setupImage{
    //setup image 1
    self.scrollView.pagingEnabled = YES;

    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.userInteractionEnabled = YES;
    
    self.view1 = imageView1;
    
    [self.scrollView addSubview:imageView1];

    NSLayoutConstraint *image1TopConstraint = [NSLayoutConstraint constraintWithItem:imageView1
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.scrollView
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0
                                                                           constant:0.0];
    image1TopConstraint.active = YES;
    
    NSLayoutConstraint *image1LeftConstraint = [NSLayoutConstraint constraintWithItem:imageView1
                                                                           attribute:NSLayoutAttributeLeading
                                                                            relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.scrollView
                                                                           attribute:NSLayoutAttributeLeading
                                                                          multiplier:1.0
                                                                            constant:0.0];
    image1LeftConstraint.active = YES;
    
    NSLayoutConstraint *image1WidthConstraint = [NSLayoutConstraint constraintWithItem:imageView1
                                                                             attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.scrollView                                                                                attribute:NSLayoutAttributeWidth
                                                                           multiplier:1.0
                                                                             constant:0];
    image1WidthConstraint.active = YES;
    
    NSLayoutConstraint *image1HeightConstraint = [NSLayoutConstraint constraintWithItem:imageView1
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.scrollView
                                                                             attribute:NSLayoutAttributeHeight
                                                                            multiplier:1.0
                                                                              constant:0.0];
   image1HeightConstraint.active = YES;
   
    //setup image2
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    imageView2.translatesAutoresizingMaskIntoConstraints = NO;
    imageView2.contentMode = UIViewContentModeScaleAspectFit;
    imageView2.userInteractionEnabled = YES;

    
    [self.scrollView addSubview:imageView2];
    
    self.view2 = imageView2;
    
    NSLayoutConstraint *image2TopConstraint = [NSLayoutConstraint constraintWithItem:imageView2
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.scrollView
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1.0
                                                                           constant:0.0];
    image2TopConstraint.active = YES;
    
    NSLayoutConstraint *image2LeftConstraint = [NSLayoutConstraint constraintWithItem:imageView2
                                                                           attribute:NSLayoutAttributeLeading
                                                                            relatedBy:NSLayoutRelationEqual
                                                                              toItem:imageView1
                                                                           attribute:NSLayoutAttributeTrailing
                                                                          multiplier:1.0
                                                                            constant:0.0];
    image2LeftConstraint.active = YES;
    
    NSLayoutConstraint *image2WidthConstraint = [NSLayoutConstraint constraintWithItem:imageView2
                                                                            attribute:NSLayoutAttributeWidth
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:self.scrollView                                                                                attribute:NSLayoutAttributeWidth
                                                                           multiplier:1.0
                                                                             constant:0.0];
    image2WidthConstraint.active = YES;
    
    NSLayoutConstraint *image2HeightConstraint = [NSLayoutConstraint constraintWithItem:imageView2
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.scrollView
                                                                             attribute:NSLayoutAttributeHeight
                                                                            multiplier:1.0
                                                                              constant:0.0];
    image2HeightConstraint.active = YES;

    
    //setup image3
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    imageView3.translatesAutoresizingMaskIntoConstraints = NO;
    imageView3.contentMode = UIViewContentModeScaleAspectFit;
    imageView3.userInteractionEnabled = YES;

    [self.scrollView addSubview:imageView3];

    self.view3 = imageView3;
    
    NSLayoutConstraint *image3TopConstraint = [NSLayoutConstraint constraintWithItem:imageView3
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.scrollView
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:0.0];
    image3TopConstraint.active = YES;
    
    NSLayoutConstraint *image3LeftConstraint = [NSLayoutConstraint constraintWithItem:imageView3
                                                                            attribute:NSLayoutAttributeLeading
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:imageView2
                                                                            attribute:NSLayoutAttributeTrailing
                                                                           multiplier:1.0
                                                                             constant:0.0];
    image3LeftConstraint.active = YES;
    
    NSLayoutConstraint *image3RightConstraint = [NSLayoutConstraint constraintWithItem:imageView3
                                                                             attribute:NSLayoutAttributeTrailing
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1.0
                                                                              constant:0.0];
    image3RightConstraint.active = YES;
    
    NSLayoutConstraint *image3WidthConstraint = [NSLayoutConstraint constraintWithItem:imageView3
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.scrollView                                                                               attribute:NSLayoutAttributeWidth
                                                                            multiplier:1.0
                                                                              constant:0.0];
    image3WidthConstraint.active = YES;
    
    NSLayoutConstraint *image3HeightConstraint = [NSLayoutConstraint constraintWithItem:imageView3
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.scrollView
                                                                              attribute:NSLayoutAttributeHeight
                                                                             multiplier:1.0
                                                                               constant:0.0];
    image3HeightConstraint.active = YES;
}

-(void)setupPageControl{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPage = 1;
    pageControl.numberOfPages = 3;
    pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.pageControl = pageControl;
    
    [self.view addSubview:pageControl];
    
    NSLayoutConstraint *pageControlBottomConstraint = [NSLayoutConstraint constraintWithItem:pageControl
                                                                                attribute:NSLayoutAttributeBottom
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.scrollView
                                                                                attribute:NSLayoutAttributeBottom
                                                                               multiplier:1.0
                                                                                 constant:0.0];
    pageControlBottomConstraint.active = YES;
    
    NSLayoutConstraint *pageControlLeftConstraint = [NSLayoutConstraint constraintWithItem:pageControl
                                                                                 attribute:NSLayoutAttributeLeading
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.scrollView
                                                                                 attribute:NSLayoutAttributeLeading
                                                                                multiplier:1.0
                                                                                  constant:0.0];
    pageControlLeftConstraint.active = YES;
    
    NSLayoutConstraint *pageControlWidthConstraint = [NSLayoutConstraint constraintWithItem:pageControl
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:self.scrollView                                                                                attribute:NSLayoutAttributeWidth
                                                                                 multiplier:1.0
                                                                                   constant:0];
    pageControlWidthConstraint.active = YES;
    
    NSLayoutConstraint *pageControlHeightConstraint = [NSLayoutConstraint constraintWithItem:pageControl
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:100];
    pageControlHeightConstraint.active = YES;
}

-(void)setupGestures{
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    UITapGestureRecognizer *tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    
    [self.view1 addGestureRecognizer:tapGesture1];
    [self.view2 addGestureRecognizer:tapGesture2];
    [self.view3 addGestureRecognizer:tapGesture3];
}

@end
