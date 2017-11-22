//
//  BYTestSimplePingViewController.m
//  iOSTrain
//
//  Created by binyu on 2017/11/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import "BYTestSimplePingViewController.h"
#import "SimplePing.h"

@interface BYTestSimplePingViewController ()<SimplePingDelegate>

@property (nonatomic,strong)SimplePing *pinger;

@end

@implementation BYTestSimplePingViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self demoe1];
}

- (void)demoe1{
    
    SimplePing *pinger = [[SimplePing alloc] initWithHostName:@"www.baidu.com"];
    self.pinger = pinger;
    
    pinger.delegate = self;
    pinger.addressStyle = SimplePingAddressStyleAny;
    [pinger start];
}

- (void)simplePing:(SimplePing *)pinger didStartWithAddress:(NSData *)address{
    NSString *str = [[NSString alloc] initWithData:address encoding:NSUTF8StringEncoding];
    NSLog(@"address=%@",address);
    [pinger sendPingWithData:nil];
}



- (void)simplePing:(SimplePing *)pinger didFailWithError:(NSError *)error{
    NSLog(@"error=%@",error);
    [self.pinger stop];
}


- (void)simplePing:(SimplePing *)pinger didSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber{
     NSLog(@"#%u sent", sequenceNumber);
    NSString *str = [[NSString alloc] initWithData:packet encoding:NSUTF8StringEncoding];
    NSLog(@"didSendPacket=%@",str);
}

- (void)simplePing:(SimplePing *)pinger didFailToSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber error:(NSError *)error{
    NSString *str = [[NSString alloc] initWithData:packet encoding:NSUTF8StringEncoding];
    NSLog(@"didFailToSendPacket=%@",str);
}

- (void)simplePing:(SimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber{
    NSString *str = [[NSString alloc] initWithData:packet encoding:NSUTF8StringEncoding];
    NSLog(@"didReceivePingResponsePacket=%@",str);
}



- (void)simplePing:(SimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet{
    NSString *str = [[NSString alloc] initWithData:packet encoding:NSUTF8StringEncoding];
    NSLog(@"simplePing=%@",str);
}



@end
