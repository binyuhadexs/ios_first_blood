//
//  BYSDWebImageTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/16.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYSDWebImageTestViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"

@interface BYSDWebImageTestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)loadImage:(id)sender;

@end

@implementation BYSDWebImageTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)loadImage:(id)sender {
    [self demo2];

}


- (void)demo2{
    /*
     核心方法 [UIImage animatedImageWithImages:images duration:duration];
     */
    
    self.imageView.image = [UIImage sd_animatedGIFNamed:@"sb"];
}

- (void)demo1{
    NSString *imgAddr = @"http://attach.bbs.miui.com/forum/201502/04/172701miz0kccvu4gu0vi4.jpg";
    [self.imageView sd_setImageWithURL:imgAddr placeholderImage:[UIImage imageNamed:@"tabbar_router_focus"] options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        NSLog(@"receivedSize: %tu expectedSize: %tu  per %ld",receivedSize,expectedSize,receivedSize*100/expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"FINISH");
    }];
}

@end
