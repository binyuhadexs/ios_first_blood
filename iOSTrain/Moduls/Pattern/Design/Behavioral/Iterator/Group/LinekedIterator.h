//
//  LinekedIterator.h
//  iOSTrain
//
//  Created by binyu on 2017/12/17.
//  Copyright © 2017年 binyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IteratorProtocol.h"
#import "LinkedList.h"

@interface LinekedIterator : NSObject<IteratorProtocol>


+(instancetype)linkedListIterator:(LinkedList *)linkedList;

@end
