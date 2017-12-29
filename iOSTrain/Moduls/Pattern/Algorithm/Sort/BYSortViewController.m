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

static void swap(int arr[],int a,int b){
    arr[a] = arr[a] + arr[b];
    arr[b] = arr[a] - arr[b]; // =原始arr[a]
    arr[a] = arr[a] - arr[b]; // =原始arr[b]
//     NSLog(@"-------------");
//    for (int i = 0; i<6; i++) {
//        NSLog(@"%d",arr[i]);
//    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self bubbleSortTest];
}

-(void)bubbleSortTest{
//    NSMutableArray *ARR =  @[@(10),@(9),@(2),@(24),@(21),@(1)];
//    int arr[] = {1,2,8,3,9,22,32,12,15};
//     int arr[] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
    int arr[] = {8,6,5,3,2,4};
    int lenght =  sizeof(arr) / sizeof(arr[0]);
//     bubbleSort(arr,lenght);
//    bubbleSort2(arr,lenght);
//    bubbleSort3(arr,lenght);
//    insertionSort2(arr,lenght);
//    selectSort(arr,lenght);
    shellSort(arr,lenght);
//    shellSort2(arr,lenght);
//    heapSort(arr,lenght);
//    mergeSort(arr,lenght);
//    quickSort(arr,lenght);
     for (int i = 0; i<lenght; i++) {
         NSLog(@"%d,%d",i,arr[i]);
     }
}


#pragma mark - 交换排序
#pragma mark - 冒泡排序
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

#pragma mark - 快速排序!!!
/*!!
 nlogn
 交换排序 采用分治法
 https://mp.weixin.qq.com/s?__biz=MzI1MTIzMzI2MA==&mid=2650561538&idx=1&sn=d2b1453e881e185b5f5b508bef74bf34&chksm=f1feea81c6896397c2dc15d586d9fc0d31b840a06b43bf34297d98963662b92c7602bf30e607&mpshare=1&scene=1&srcid=1201K1a5EOSC6nLgOfdCSTQh&key=703ab09a9dfbc0dce50697cf2a0a6f1b5ecff93de70c12a677847154577459cf0bf07d958d28df74cc1fcba072bcca189cb5a8de2f8103cd58b98ea0f55c831fdb54ccf87206b5f21336a93434155917&ascene=0&uin=Njg5MDYzMzgw&devicetype=iMac+MacBookPro11%2C1+OSX+OSX+10.12.6+build(16G29)&version=11020201&pass_ticket=k5E7NDJDOjfgLEyp2FxfzPd2Erw9yK0j84YoCtUbGH%2FW2NNz%2FTuM226MVRlN19uS
 
 */

void quickSort(int array[],int count){
    quickSortAction(array,0,count-1);
}

void quickSortAction(int arr[],int left,int right) {
    if (left < right) {
        //获取枢纽值，并将其放在当前待处理序列末尾
        dealPivot(arr, left, right);
        //枢纽值被放在序列末尾
        int pivot = right - 1;
        //左指针
        int i = left;
        //右指针
        int j = right - 1;
        while (true) {
            while (arr[++i] < arr[pivot]) {//找到比枢纽值大的数
            }
            while (j > left && arr[--j] > arr[pivot]) {
            }
            if (i < j) {
                swap1(arr, i, j);
            } else {
                break;
            }
        }
        if (i < right) {
            swap1(arr, i, right - 1);
        }
        quickSortAction(arr, left, i - 1);
        quickSortAction(arr, i + 1, right);
    }
}



/**
 * 处理枢纽值
 */
void dealPivot(int arr[] , int left, int right) {
    int mid = (left + right) / 2; // 左 中 右排序
    if (arr[left] > arr[mid]) {//左边 > 中间
        swap1(arr, left, mid);
    }
    if (arr[left] > arr[right]) { //左边 > 又边
        swap1(arr, left, right);
    }
    if (arr[right] < arr[mid]) { //右边 < 中间
        swap1(arr, right, mid);
    }
    swap1(arr, right - 1, mid);//将中间值和到数第二个值交换
}

void swap1(int arr[],int a, int b) {
    int temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
}


#pragma mark - 选择排序
#pragma mark - 简单选择排序

/*
 简单选择排序
 每趟确定最小或最大元素下标
 */
void selectSort(int array[],int count){
    for (int i = 0; i<count-1; i++) {
        int min = i; //标记最小的下
        for (int j = i+1; j <count; j++) {
            if (array[j] < array[min]) { //确定最小元素角标
                min = j;
            }
        }
        if (min != i) { //当前脚本不是最小进行交换
           swap(array, min, i);
        }
    }
}

//BUG
//二元选择排序
void selectSort1(int array[],int count){
    for (int i = 1; i<count/2; i++) {
        int min = i; //标记最小的下标
        int max = i; //标记最大的下标
        for (int j = i+1; j <count-i; j++) {
            if (array[j] > array[max]) {
                max = j;
                continue;
            }
            
            if (array[j] < array[min]) {
                min = j;
            }
        }
        if (min != i) { //当前脚本不是最小 进行交换
            swap(array, min, i-1);
        }
        if (max != i) { //当前脚本不是最大 进行交换
            swap(array, max, count-i);
        }
    }
}

#pragma mark - 堆排序!!!

/*
 nlogn
 将待排序队列构造成大顶堆或 然后和末尾元素交换，然后把剩下的N-1个元素构造成堆，以此类推，

 第一个非叶子节点 arr.length/2-1
 i子节点 = 2i+1
 
 步骤
 a|构造堆 按照需求构造大顶堆或者小顶堆
 b|将堆顶元素和末尾元素交换  沉淀到最后
 c|重新调整结构，使其满足堆定义 然后继续交换
 */

void heapSort(int array[],int count){
    //构建大顶堆
    for (int i = count/2-1; i >=0 ; i--) {
        justHeap(array, i, count);
    }
    //调整堆结构 +交换堆顶元素与末尾元素
    for (int j = count -1; j > 0; j--) {
        swap(array, 0, j); //顶元素和末尾元素交换
        justHeap(array, 0, j);//重新对堆进行调整
    }
}

//调整堆
void justHeap(int array[],int i,int count){
    int temp = array[i]; //取出当前元素
    for (int k = i*2+1; k<count; k= k*2+1) { //从i节点的左子节点开始
        if (k+1 < count && array[k] < array[k+1]) { //如果左节点小于右节点 K指向右节点
            k++;
        }
        if (array[k]> temp) { //如果子节点 > 父节点  将子节点赋值给父节点
            array[i] = array[k];
            i = k;
        } else {
            break;
        }
        array[i] = temp;//将temp放在最终位置
    }
}





/*
 每一步将一个待排序的记录 插入到前面已经排好序的有序队列中，直到结束
 */
#pragma mark - 插入排序
void insertionSort(int array[],int count){
    for (int i = 1; i<count; i++) {
        int j =i;
        while (j > 0 && array[j] < array[j-1]) {
            swap(array, j, j-1);
            j--;
        }
    }
}

void insertionSort2(int array[],int count){
    for (int i = 1; i<count; i++) {
        //
        if (array[i] < array[i-1]) {
            int j = i -1;
            int x = array[i];
            array[i] = array[i-1];
            while (x < array[j]) {
                array[j+1] = array[j];
                j--;
            }
            array[j+1] = x;
        }
    }
}

#pragma mark -希尔排序
/*
 记录下标的增量分组 对每个组进行插入排序 当增量为1是排序结束
 跳跃式分组
 对增量序列的选择非常重要 影响效率
 步骤
 a|分组
 b|对分组插入排序
 */

void shellSort(int array[],int count){
    for (int gap = count/2; gap > 0; gap/=2) {
//        NSLog(@"gap=%d",gap);
        for (int i = gap; i< count; i++) {
            int j = i;
            while (j-gap >= 0 && array[j] < array[j-gap]) {
                swap(array, j, j-gap);
                j-=gap;
            }
        }
    }
}

void shellSort2(int array[],int count){
    for (int gap = count/2; gap > 0; gap/=2) {
        for (int i = gap; i< count; i++) {
            int j = i;
            int tmp = array[i];
            if (array[j] < array[j-gap]) {
                while (j-gap > 0 && array[j] < array[j-gap]) {
                    array[j] = array[j-gap]; //移动法
                    j-=gap;
                }
            }
            array[j] = tmp;
        }
    }
}

#pragma mark - 归并排序!!!
/*
 log2n
 该算法采用经典的分治（divide-and-conquer）策略（分治法将问题分(divide)成一些小的问题然后递归求解，而治(conquer)的阶段则将分的阶段得到的各答案"修补"在一起，即分而治之)。
 稳定排序
 
 */

void mergeSort(int array[],int count){
    int tempArr[count];
    mergeSortAction(array,0,count-1,tempArr);
}

static void mergeSortAction(int array[] ,int left,int right,int temp[]){
    if(left < right){
        int mid = (left+right)/2;
        mergeSortAction(array,left,mid,temp);//左边归并排序，使得左子序列有序
        mergeSortAction(array,mid+1,right,temp);//右边归并排序，使得右子序列有序
        mergeAction(array,left,mid,right,temp);//将两个有序子数组合并操作
    }
}

void mergeAction(int arr[] ,int left,int mid,int right,int temp[] ){
    int i = left;//左序列指针
    int j = mid+1;//右序列指针
    int t = 0;//临时数组指针
    while (i<=mid && j<=right){
        if(arr[i]<=arr[j]){
            temp[t++] = arr[i++];
        }else {
            temp[t++] = arr[j++];
        }
    }
    while(i<=mid){//将左边剩余元素填充进temp中
        temp[t++] = arr[i++];
    }
    while(j<=right){//将右序列剩余元素填充进temp中
        temp[t++] = arr[j++];
    }
    t = 0;
    //将temp中的元素全部拷贝到原数组中
    while(left <= right){
        arr[left++] = temp[t++];
    }
}


#pragma mark - 基数排序!!!

@end
