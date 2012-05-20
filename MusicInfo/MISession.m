//
//  MISession.m
//  MusicInfo
//
//  Created by John May on 12/12/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import "MISession.h"
#import "MIDiscogApi.h"

@implementation MISession
@synthesize discogsApi;
@synthesize searchResults;

-(void)start 
{
    NSMutableDictionary *headerFields = [NSMutableDictionary dictionary]; 
    [headerFields setValue:@"iOS" forKey:@"x-client-identifier"];

    self.discogsApi = [[MIDiscogsApi alloc] initWithHostName:@"api.discogs.com" 
                    customHeaderFields:headerFields];
}

-(void)searchFor:(NSString *)searchString withType:(NSString *)searchType 
{
    [self.discogsApi searchFor:[searchString urlEncodeUsingEncoding:NSUTF8StringEncoding]
                    searchType:[searchType urlEncodeUsingEncoding:NSUTF8StringEncoding]
                  onCompletion:^(NSArray *searchList){
                      [searchResults arrayByAddingObjectsFromArray:searchList];
                      DLog(@"%@",searchList);
                        }
                             onError:^(NSError* error) {
        
        NSLog(@"%@\t%@\t%@\t%@", [error localizedDescription], 
                                 [error localizedFailureReason], 
                                 [error localizedRecoveryOptions], 
                                 [error localizedRecoverySuggestion]);
    }];   
    
}
@end
