//
//  BYAlgorithmTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/12/4.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYAlgorithmTestViewController.h"


@interface BYAlgorithmTestViewController ()

@end

@implementation BYAlgorithmTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int count =  digitCounts4(1,99);
    NSLog(@"count=%d",count);
}

int digitalCounts1(int k, int n) {
    int m = 0,m2 = 0;
    int count = 0;
    while ( m2 <= n ) {
        m = m2;
        if ( m % 10 == k ) {
            count++;
        }
        while ( m >= 10 ) {
            m /= 10;
            if ( m % 10 == k ) {
                count++;
            }
        }
        m2++;
    }
    return count;
}
int digitCounts4(int k, int n) {
    int count=0,singlecount=0;
    int p=n;
    int num=0;//表示处理数字的位数 num=0表示处理个位 1表示十位等
    if(k==0) return (n/10)+1;
    if(n==0) return 0;
    while(p!=0){
        if((p%10)>k) singlecount=(int) ((p/10+1)*(pow(10, (double)num)));
        if((p%10)==k) singlecount=(int) ((p/10) * (pow(10, (double)num)) + (int)n % (int)pow(10, (double)num) +1);
                                         //   ((double)n % (double)(pow(10, (double)num)))+1);
        if((p%10)<k)  singlecount=(int) ((p/10)*(pow(10, (double)num)));
        count+=singlecount;
        p=p/10;
        num++;
    }
    return count;
}


 @end
