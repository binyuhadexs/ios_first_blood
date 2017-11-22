//
//  BYSocketTestViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/18.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYSocketTestViewController.h"

#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface BYSocketTestViewController ()

@end

@implementation BYSocketTestViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self socketDemo];
}


-(void)socketDemo{
    //1.创建socket
    /**
     参数
     
     domain:    协议域，AF_INET -> IPV4
     type:      Socket 类型，SOCK_STREAM/SOCK_DGRAM
     protocol: IPPROTO_TCP,如果传入0 那么会自动根据第二个参数选择合适的协议
     
     返回值
     socket
     */
    
    int clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    //2.连接到服务器
    /**
     参数
     1> 客户端socket
     2> 指向数据结构sockaddr的指针，其中包括目的端口和IP地址
     3> 结构体数据长度
     返回值
     0 成功/其他 错误代号
     */
    struct sockaddr_in severAddr;
    severAddr.sin_family = AF_INET;
    //端口
    severAddr.sin_port = htons(22);
    //地址
    severAddr.sin_addr.s_addr = inet_addr("127.0.0.1");
    
    int connResult =  connect(clientSocket, (const struct sockaddr *)&severAddr, sizeof(severAddr));
    if (connResult == 0) {
        NSLog(@"连接成功!!");
    }else{
        NSLog(@"失败了 %d",connResult);
        return;
    }
    //3.发送数据给服务器
    /**
     参数
     1> 客户端socket
     2> 发送内容地址
     3> 发送内容长度
     4> 发送方式标志，一般为0
     返回值
     如果成功，则返回发送的字节数，失败则返回SOCKET_ERROR
     */
    NSString * sendMsg =@"Hellolo";
    ssize_t sendLen = send(clientSocket, sendMsg.UTF8String, strlen(sendMsg.UTF8String), 0);
    NSLog(@"发送了%ld个字节",sendLen);
    //4.从服务器接受数据
    /**
     参数
     1> 客户端socket
     2> 接收内容缓冲区地址
     3> 接收内容缓存区长度
     4> 接收方式，0表示阻塞，必须等待服务器返回数据
     返回值
     如果成功，则返回读入的字节数，失败则返回SOCKET_ERROR
     */
    uint8_t buffer[1024];//要把空间准备出来!
    
    ssize_t recvLen = recv(clientSocket, buffer, sizeof(buffer), 0);
    NSLog(@"接收到了%ld个字节",recvLen);
    //5.关闭socket连接
}



@end
