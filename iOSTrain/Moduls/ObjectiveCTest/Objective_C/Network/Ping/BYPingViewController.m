//
//  ViewController.m
//  Ping
//
//  Created by lgqyhm on 14-5-20.
//  Copyright (c) 2014年 lgqyhm. All rights reserved.
//

#import "BYPingViewController.h"
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>
#include <netdb.h>
#include <setjmp.h>
#include <errno.h>
#include <sys/time.h>
#import <netinet/udp.h>

#define PACKET_SIZE 4096
#define MAX_WAIT_TIME   5
#define MAX_NO_PACKETS  10000
#define SRCPORT         9050	// UDP packet source port
#define DSTPORT         58127	// UDP packet destination port
#define MAX_TTL         64       // Max hop
#define UDPPACKET_SIZE  40
#define MAXPACKET       65535	// Max size of IP packet


char *addr[100];
char sendpacket[PACKET_SIZE];
char recvpacket[PACKET_SIZE];
int sockfd,datalen = 56;
int nsend = 0, nreceived = 0;
double temp_rtt[MAX_NO_PACKETS];
double all_time = 0;
double min = 0;
double max = 0;
double avg = 0;
double mdev = 0;

struct sockaddr_in dest_addr;
struct sockaddr_in from;
struct timeval tvrecv;
pid_t pid;

//void statistics(int sig);
void send_packet(void);
void recv_packet(void);
//void computer_rtt(void);
void tv_sub(struct timeval *out,struct timeval *in);
int pack(int pack_no);
int unpack(char *buf,int len);
unsigned short cal_checksum(unsigned short *addr,int len);


@interface BYPingViewController ()

@end

@implementation BYPingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                       NSLog(@"IP %@",[self getWANIIPAdress]);
                       ping("www.baidu.com");
                       
                       //    ping("192.168.199.1");
                       //    [self getAllReturnIpStr:@"www.163.com"];
    });
    
}


- (void)demo{
    
    
}

//获取局域网本机IP
- (NSString *)getLANIIPAdress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while (temp_addr !=NULL) {
            if (temp_addr->ifa_addr->sa_family==AF_INET) {
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    
    return address;
}

//获取外网IP
- (NSString *)getWANIIPAdress
{
    NSString *IP = @"0.0.0.0";
    NSURL *url = [NSURL URLWithString:@"http://ifconfig.me/ip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:8.0];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"Failed to get WAN IP Address!\n%@", error);
        [[[UIAlertView alloc] initWithTitle:@"获取外网 IP 地址失败" message:[error localizedFailureReason] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    } else {
        NSString *responseStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        IP = responseStr;
    }
    
    return IP;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Ping

/****检验和算法****/
unsigned short cal_chksum(unsigned short *addr,int len)
{
    int nleft = len;
    int sum = 0;
    unsigned short *w = addr;
    unsigned short check_sum = 0;
    
    while(nleft>1)      //ICMP包头以字（2字节）为单位累加
    {
        sum += *w++;
        nleft -= 2;
    }
    
    if(nleft == 1)      //ICMP为奇数字节时，转换最后一个字节，继续累加
    {
        *(unsigned char *)(&check_sum) = *(unsigned char *)w;
        sum += check_sum;
    }
    sum = (sum >> 16) + (sum & 0xFFFF);
    sum += (sum >> 16);
    check_sum = ~sum;   //取反得到校验和
    return check_sum;
}

/*设置ICMP报头*/
int pack(int pack_no)
{
    int packsize;
    struct icmp *icmp;
    struct timeval *tval;
    icmp = (struct icmp*)sendpacket;
    icmp->icmp_type = ICMP_ECHO;    //ICMP_ECHO类型的类型号为0
    icmp->icmp_code = 0;
    icmp->icmp_cksum = 0;
    icmp->icmp_seq = pack_no;   //发送的数据报编号
    icmp->icmp_id = pid;
    
    packsize = 8 + datalen;     //数据报大小为64字节
    tval = (struct timeval *)icmp->icmp_data;
    gettimeofday(tval,NULL);        //记录发送时间
    //校验算法
    icmp->icmp_cksum =  cal_chksum((unsigned short *)icmp,packsize);
    return packsize;
}

/****发送三个ICMP报文****/
void send_packet()
{
    int packetsize;
    if(nsend < MAX_NO_PACKETS)
    {
        nsend++;
        packetsize = pack(nsend);   //设置ICMP报头
        //发送数据报
        if(sendto(sockfd,sendpacket,packetsize,0,
                  (struct sockaddr *)&dest_addr,sizeof(dest_addr)) < 0)
        {
            perror("sendto error");
        }
    }
    
}

/****接受所有ICMP报文****/
void recv_packet()
{
    int n,fromlen;
    extern int error;
    fromlen = sizeof(from);
    if(nreceived < nsend)
    {
        //接收数据报
        if((n = recvfrom(sockfd,recvpacket,sizeof(recvpacket),0,
                         (struct sockaddr *)&from,&fromlen)) < 0)
        {
            perror("recvfrom error");
        }
        gettimeofday(&tvrecv,NULL);     //记录接收时间
        unpack(recvpacket,n);       //剥去ICMP报头
        nreceived++;
    }
}

/******剥去ICMP报头******/
int unpack(char *buf,int len)
{
    int iphdrlen;       //ip头长度
    struct ip *ip;
    struct icmp *icmp;
    struct timeval *tvsend;
    double rtt;
    
    ip = (struct ip *)buf;
    iphdrlen = ip->ip_hl << 2;  //求IP报文头长度，即IP报头长度乘4
    icmp = (struct icmp *)(buf + iphdrlen); //越过IP头，指向ICMP报头
    len -= iphdrlen;    //ICMP报头及数据报的总长度
    if(len < 8)     //小于ICMP报头的长度则不合理
    {
        printf("ICMP packet\'s length is less than 8\n");
        return -1;
    }
    //确保所接收的是所发的ICMP的回应
    if((icmp->icmp_type == ICMP_ECHOREPLY) && (icmp->icmp_id == pid))
    {
        tvsend = (struct timeval *)icmp->icmp_data;
        tv_sub(&tvrecv,tvsend); //接收和发送的时间差
        //以毫秒为单位计算rtt
        rtt = tvrecv.tv_sec*1000 + tvrecv.tv_usec/1000;
        temp_rtt[nreceived] = rtt;
        all_time += rtt;    //总时间
        //显示相关的信息
        printf("%d bytes from %s: icmp_seq=%u ttl=%d time=%.1f ms\n",
               len,inet_ntoa(from.sin_addr),
               icmp->icmp_seq,ip->ip_ttl,rtt);
        return 0;
        
    }
    else return -1;
}

//两个timeval相减
void tv_sub(struct timeval *recvtime,struct timeval *sendtime)
{
    long sec = recvtime->tv_sec - sendtime->tv_sec;
    long usec = recvtime->tv_usec - sendtime->tv_usec;
    if(usec >= 0){
        recvtime->tv_sec = sec;
        recvtime->tv_usec = usec;
    }else{
        recvtime->tv_sec = sec - 1;
        recvtime->tv_usec = -usec;
    }
}

//ping
void ping(char *address)
{
    struct hostent *host;
    struct protoent *protocol;
    int size = 50 * 1024;
    addr[0] = address;
    
    if((protocol = getprotobyname("icmp")) == NULL)
    {
        perror("getprotobyname");
        return;
    }
    
    //生成使用ICMP的原始套接字
    if((sockfd = socket(AF_INET,SOCK_DGRAM,IPPROTO_ICMP)) < 0)
    {
        perror("socket error");
        return;
    }
    
    
    /*扩大套接字的接收缓存区导50K，这样做是为了减小接收缓存区溢出的
     可能性，若无意中ping一个广播地址或多播地址，将会引来大量的应答*/
    setsockopt(sockfd,SOL_SOCKET,SO_RCVBUF,&size,sizeof(size));
    bzero(&dest_addr,sizeof(dest_addr));    //初始化
    dest_addr.sin_family = AF_INET;     //套接字域是AF_INET(网络套接字)
    
    //判断主机名是否是IP地址
    if(inet_addr(address) == INADDR_NONE)
    {
        if((host = gethostbyname(address)) == NULL) //是主机名
        {
            perror("gethostbyname error");
            return;
        }
        memcpy((char *)&dest_addr.sin_addr,host->h_addr,host->h_length);
    }
    else{ //是IP 地址
        dest_addr.sin_addr.s_addr = inet_addr(address);
    }
    //获取进程识别码
    pid = getpid();
    printf("PING %s(%s):%d bytes of data.\n",address,
           inet_ntoa(dest_addr.sin_addr),datalen);
    
//    //当按下ctrl+c时发出中断信号，并开始执行统计函数
//    signal(SIGINT,statistics);
    while(nsend < MAX_NO_PACKETS){
        sleep(1);       //每隔一秒发送一个ICMP报文
        send_packet();      //发送ICMP报文
        recv_packet();      //接收ICMP报文
    }
    
}

#pragma mark - traceroute

-(NSString *)getAllReturnIpStr:(NSString *)dstaddrStr
{
   NSString *allIpStr = nil;//每次调用前初始化！
    char *dstaddrChar = (char *)[dstaddrStr UTF8String];
    
    struct sockaddr_in haddr;	// remote host address
	struct sockaddr_in laddr;	// local host address
	int sndsock, rcvsock;
    
	// fill destination address
    /*下面这一段对付用戶输入的目标:是名字如www.sohu.com还是地址如127.0.0.1*/
	bzero(&haddr, sizeof(haddr));
    haddr.sin_family = AF_INET;
	haddr.sin_port = htons(DSTPORT);
	haddr.sin_addr.s_addr =  inet_addr(dstaddrChar);//v[1]
    
    //lxf
    if (haddr.sin_addr.s_addr == -1) //是名字如www.sohu.com
    {
        struct hostent *hp = gethostbyname(dstaddrChar);
        if (hp) {
            haddr.sin_family = hp->h_addrtype;
			bcopy(hp->h_addr, (caddr_t)&haddr.sin_addr, hp->h_length);
        }
        unsigned char ip[16];
        char *ipStr = [self inet_ntoay:haddr.sin_addr.s_addr ip:ip];
        
        NSLog(@"ip:%s",ipStr);
    }
    
	// fill local host address
	bzero(&laddr, sizeof(laddr));
	laddr.sin_family = AF_INET;
	laddr.sin_port = htons(SRCPORT);
	laddr.sin_addr.s_addr = htonl(INADDR_ANY);
    
	// create send socket
	if((sndsock = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
	{
        
		return nil;
	}
    int opt = 1;
    setsockopt(sndsock,SOL_SOCKET,SO_REUSEADDR,(const char*)&opt,sizeof(int));
    //将一本地地址与一套接口捆绑,适用于未连接的数据报或流类套接口
	if(bind(sndsock, (struct sockaddr *)&laddr, sizeof(laddr)) == -1){
		return nil;
	}
	// create receive socket
	if((rcvsock = socket(AF_INET, SOCK_DGRAM, IPPROTO_ICMP)) < 0){
		return nil;
	}
    struct timeval tv ;
    tv.tv_sec = 1;
    tv.tv_usec =0;
    //    select(rcvsock, &readfds, NULL, NULL, &tv);
    int status = setsockopt(rcvsock, SOL_SOCKET, SO_RCVTIMEO, &tv, sizeof(tv));
    NSLog(@"status %d",status);
    
    struct sigaction sa;
    sa.sa_handler = SIG_IGN;
    sigaction( SIGPIPE, &sa, 0 );
	
    // start to trace route
	int ttlNum, n;
	unsigned long lastaddr;
	int get_des = 0;	// whether get destination
    
	for(ttlNum = 1; ttlNum < MAX_TTL; ttlNum++)
	{
        
		int probe_count;
		int has_addr = 0;	// whether have printed address
        
		for(probe_count = 0; probe_count < 3; probe_count++)
		{
			struct sockaddr_in from;
			struct timeval t1, t2;
			char buf[MAXPACKET];
			
            
			gettimeofday(&t1, 0);
			BOOL bSuccessed = [self send_tracert:sndsock dstaddr:&haddr ttl:ttlNum];//lxf 发送是否成功
            if (!bSuccessed) {
                close(sndsock);
                return nil;
            }
			while((n = [self recv_tracert:rcvsock srcaddr:&from buf:buf buflen:MAXPACKET]))//sizeof(buf) lxf 接收
			{
				gettimeofday(&t2, 0);
				if([self check_packet:(u_char *)buf buflen:sizeof(buf)])
				{
                    
					// reach destination
					if(from.sin_addr.s_addr == haddr.sin_addr.s_addr)
                    {
						get_des++;
                        NSLog(@"Traceroute at destination");
                    }
                    
					// if last ttl
					if(from.sin_addr.s_addr != lastaddr)
					{
                        
						if(has_addr == 0)
						{
							unsigned char ip[16];
                            char *ipStr = [self inet_ntoay:from.sin_addr.s_addr ip:ip];
                            if (!allIpStr) {
                                allIpStr = [NSString stringWithFormat:@"%s",ipStr];
                            }
                            else {
                                allIpStr = [NSString stringWithFormat:@"%@|%s",allIpStr,ipStr];
                                NSLog(@"%@",allIpStr);
                            }
							has_addr = 1;
						}
                        if(probe_count == 2)
							lastaddr = from.sin_addr.s_addr;
						break;
					}
				}
                
			}
            
		}
        
		if(get_des)
			break;
	}
    
    //lxf
    close(sndsock);
    return allIpStr;
    
}

-(BOOL)send_tracert:(int)sndsock dstaddr:(struct sockaddr_in *)dstaddr ttl:(int)ttl
{
	char buf[UDPPACKET_SIZE];
	memset(buf, 0, sizeof(buf));	// using bzero() would be more efficient for small array
	int n;
    
	if(setsockopt(sndsock, IPPROTO_IP, IP_TTL, (char *)&ttl, sizeof(ttl)) == -1){
		return NO;
	}
    
	if((n = sendto(sndsock, buf, UDPPACKET_SIZE, 0, (struct sockaddr *)dstaddr, sizeof(struct sockaddr_in))) == -1){
		return NO;
	}
    
	if(n != UDPPACKET_SIZE){
		return NO;
	}
    
    return YES;
}

-(int) recv_tracert:(int) rcvsock srcaddr:(struct sockaddr_in *)srcaddr  buf:(char *)databuf buflen:(int) buflen
{
	int n;
	unsigned int len = sizeof(struct sockaddr_in);
  	if((n = recvfrom(rcvsock, databuf, buflen, 0, (struct sockaddr *)srcaddr, &len)) <0){
		return 0;
	}
    
	return n;
}

-(int) check_packet :(u_char *)databuf buflen:(int) buflen
{
	// handle ip header
	struct ip *ip = (struct ip *)databuf;
	int hlen = ip->ip_hl << 2;		// total ip header length
	if(ip->ip_p != IPPROTO_ICMP){
		return 0;
	}
    
	// handle icmp header
	struct icmp *icmp = (struct icmp *)(databuf + hlen);
    
	// icmp time out packet
	if(icmp->icmp_type == 11 && icmp->icmp_code == 0){
		struct ip *iip = (struct ip *)&icmp->icmp_ip;
		int ihlen = iip->ip_hl << 2;
		struct udphdr *udp = (struct udphdr *)((u_char *)iip + ihlen);
		if(iip->ip_p == IPPROTO_UDP && udp->uh_sport == htons(SRCPORT) && udp->uh_dport == htons(DSTPORT))
			return 1;
	}
    
	// icmp not reachable packet
	if(icmp->icmp_type == 3 && icmp->icmp_code == 3){
		struct ip *iip = (struct ip *)&icmp->icmp_ip;
		int ihlen = iip->ip_hl << 2;
		struct udphdr *udp = (struct udphdr *)((u_char *)iip + ihlen);
		if(iip->ip_p == IPPROTO_UDP && udp->uh_sport == htons(SRCPORT) && udp->uh_dport == htons(DSTPORT))
			return 1;
	}
	return 0;
}

-(char *)inet_ntoay:(unsigned long) addr ip:(unsigned char *)ip{
	unsigned char *p = (unsigned char *)&addr;
	sprintf((char *)ip, "%d.%d.%d.%d", p[0], p[1], p[2], p[3]);//把格式化的数据写入某个字符串中
	return (char *)ip;
}




@end
