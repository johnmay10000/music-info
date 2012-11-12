//
//  MISoundcloudApi.m
//  MusicInfo
//
//  Created by John May on 20/05/12.
//  Copyright (c) 2012 John May. All rights reserved.
//

#import "MISoundcloudApi.h"
#import "JSONKit.h"

#define CLIENT_ID @"054c41e5be71cedecb81c62cb3538603"

#define SOUNDCLOUD_TRACKS_URL(__C1__, __C2__) [NSString stringWithFormat:@"tracks.json?client_id=%@&q=%@&limit=10", __C1__, __C2__]

@implementation MISoundcloudApi
-(MKNetworkOperation*) searchFor:(NSString *)searchParam
                      searchType:(NSString *)searchType
                    onCompletion:(SoundcloudSearchResponseBlock)completionBlock
                         onError:(MKNKErrorBlock) errorBlock{

    MKNetworkOperation *op = [self operationWithPath:SOUNDCLOUD_TRACKS_URL(CLIENT_ID,searchParam)
                                              params:nil
                                          httpMethod:@"GET"];

    [op onCompletion:^(MKNetworkOperation *completedOperation)
     {
         // the completionBlock will be called twice.
         // if you are interested only in new values, move that code within the else block
         NSString *response = [completedOperation responseString];
         NSArray *results = [response objectFromJSONString];

         for (NSDictionary *result in results) {
              NSString *title = [result objectForKey:@"title"];
             NSString *stream_url = [result objectForKey:@"stream_url"];
         }
//         __unused NSDictionary *pagination = [resultsDictionary objectForKey:@"pagination"];
//         NSArray *results = [resultsDictionary objectForKey:@"results"];
         //         for (NSDictionary *result in results) {
         //             NSLog(@"%@", [result valueForKey:@"resource_url"]);
         //             NSLog(@"%@", result);
         //             NSLog(@"%@", [result valueForKey:@"style"]);
         //         }

         if([completedOperation isCachedResponse]) {
             //             DLog(@"Data from cache %@", [completedOperation responseString]);
         }
         else {
             //             DLog(@"Data from server %@", [completedOperation responseString]);
         }
         completionBlock(results);
     } onError:^(NSError* error) {
         errorBlock(error);
     }];

    [self enqueueOperation:op];

    return op;
}


@end
