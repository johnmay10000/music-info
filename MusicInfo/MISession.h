//
//  MISession.h
//  MusicInfo
//
//  Created by John May on 12/12/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MISession : NSObject

@property (nonatomic, strong) MIDiscogsApi *discogsApi
-(void)start;
@end
