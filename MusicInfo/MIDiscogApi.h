//
//  MIApi.h
//  MusicInfo
//
//  Created by John May on 10/12/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MIDiscogsApi : MKNetworkEngine
typedef void (^DiscogsSearchResponseBlock)(NSArray *resultList);

-(MKNetworkOperation*) searchFor:(NSString *)searchParam
                      searchType:(NSString *)searchType
                    onCompletion:(DiscogsSearchResponseBlock)completion
                         onError:(MKNKErrorBlock) error;

@end
