//
//  MISoundcloudApi.h
//  MusicInfo
//
//  Created by John May on 20/05/12.
//  Copyright (c) 2012 John May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MISoundcloudApi : MKNetworkEngine
typedef void (^SoundcloudSearchResponseBlock)(NSArray *resultList);

-(MKNetworkOperation*) searchFor:(NSString *)searchParam
                      searchType:(NSString *)searchType
                    onCompletion:(SoundcloudSearchResponseBlock)completion
                         onError:(MKNKErrorBlock) error;
@end
