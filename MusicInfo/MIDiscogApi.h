//
//  MIApi.h
//  MusicInfo
//
//  Created by John May on 10/12/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"

@interface MIDiscogsApi : MKNetworkEngine
typedef void (^DiscogArtistResponseBlock)(NSArray *artistList);

-(MKNetworkOperation*) searchForArtist:(NSString *)artistName 
                          onCompletion:(DiscogArtistResponseBlock) completion
                               onError:(MKNKErrorBlock) error;

@end
