//
//  HandleImageView.h
//  06-画板
//
//  Created by Gavin on 15/9/14.
//  Copyright © 2015年 Gavin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HandleImageView;
@protocol HandleImageViewDelegate <NSObject>


- (void)handleImageView:(HandleImageView *)handleImageV newImage:(UIImage *)image;

@end



@interface HandleImageView : UIView

@property (nonatomic, strong) UIImage *image;

@property(nonatomic,weak) id<HandleImageViewDelegate>delegate;


@end
