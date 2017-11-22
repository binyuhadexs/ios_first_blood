//
//  BYSortViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/21.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYSortViewController.h"

@interface BYSortViewController ()

@end

@implementation BYSortViewController

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self bubbleSortTest];
}

-(void)bubbleSortTest{
//    NSMutableArray *ARR =  @[@(10),@(9),@(2),@(24),@(21),@(1)];
    int arr[] = {1,2,8,3,9,22,32,12};
    int lenght =  sizeof(arr) / sizeof(arr[0]);
//     bubbleSort(arr,lenght);
//    bubbleSort2(arr,lenght);
    bubbleSort3(arr,lenght);
     for (int i = 0; i<lenght; i++) {
         NSLog(@"%d,%d",i,arr[i]);
     }
}

#pragma 交换排序
/*
 冒泡排序
 较大的数往下沉，较小的往上冒。即：每当两相邻的数比较后发现它们的排序与排序要求相反时，就将它们互换。
 */
void bubbleSort(int array[],int count){
    for (int i = 0; i<count-1; i++) {
        for (int j = 0; j <count-i-1; j++) {
            if (array[j] < array[j+1]) {
                 int tmp = array[j];
                 array[j] = array[j+1];
                 array[j+1] = tmp;
            }
        }
    }
}

//冒泡排序优化
void bubbleSort2(int array[],int count){
    int i= count-1;
    while (i > 0) {
        int pos = 0;
        for (int j = 0; j<i; j++) {
            if (array[j] > array[j+1]) {
                pos = j;
                int tmp = array[j];
                array[j] = array[j+1];
                array[j+1] = tmp;
            }
        }
        i = pos;//
    }
}

//冒泡排序优化
//每趟排序中进行正向和反向两遍冒泡的方法一次可以得到两个最终值(最大者和最小者) , 从而使排序趟数几乎减少了一半。
void bubbleSort3(int array[],int count){
    int low = 0; //最小
    int high = count - 1;
    int tmp,j;
    while (low < high) {
        int pos = 0;
        for (j = low; j<high; j++) {///正向冒泡,找到最大者
            if (array[j] > array[j+1]) {
                pos = j;
                tmp = array[j];
                array[j] = array[j+1];
                array[j+1] = tmp;
            }
        }
        --high;
        for (j = high; j>low; j--) {//反向冒泡,找到最小者
            if (array[j] < array[j-1]) {
                pos = j;
                tmp = array[j];
                array[j] = array[j-1];
                array[j-1] = tmp;
            }
        }
        ++low;
    }
}


/*
 快速排序
 */
//Quick Sort



#pragma 选择排序




@end
