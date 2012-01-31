//
//  MIDiscogsApi.m
//  MusicInfo
//
//  Created by John May on 10/12/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import "MIDiscogApi.h"
#import "JSONKit.h"

#define DISCOGS_ARTIST_URL(__C1__) [NSString stringWithFormat:@"/database/search?q=%@", __C1__]

@implementation MIDiscogsApi

-(MKNetworkOperation*) searchForArtist:(NSString *)artistName 
                          onCompletion:(DiscogArtistResponseBlock)completionBlock
                               onError:(MKNKErrorBlock) errorBlock {
    
    MKNetworkOperation *op = [self operationWithPath:DISCOGS_ARTIST_URL(artistName) 
                                              params:nil 
                                          httpMethod:@"GET"];
    
    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         // the completionBlock will be called twice. 
         // if you are interested only in new values, move that code within the else block
        NSString *response = [completedOperation responseString];
        __unused NSDictionary *resultsDictionary = [response objectFromJSONString];
        __unused NSDictionary *pagination = [resultsDictionary objectForKey:@"pagination"];
        __unused NSDictionary *results = [resultsDictionary objectForKey:@"results"];
//         __unused NSArray *a = [[completedOperation responseString] componentsSeparatedByString:@","];
//         NSString *valueString = [[[completedOperation responseString] componentsSeparatedByString:@","] objectAtIndex:1];
//         NSLog(@"%@", valueString);
         
         if([completedOperation isCachedResponse]) {
             //DLog(@"Data from cache %@", [completedOperation responseString]);
         }
         else {
             //DLog(@"Data from server %@", [completedOperation responseString]);
         }
         
         completionBlock([NSArray array]);
         
     } onError:^(NSError* error) {
         
         errorBlock(error);
     }];
    
    [self enqueueOperation:op];
    
    return op;
}



@end
