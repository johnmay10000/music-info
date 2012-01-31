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

-(void)start 
{
    NSMutableDictionary *headerFields = [NSMutableDictionary dictionary]; 
    [headerFields setValue:@"iOS" forKey:@"x-client-identifier"];

    self.discogsApi = [[MIDiscogsApi alloc] initWithHostName:@"api.discogs.com" 
                    customHeaderFields:headerFields];
}

-(void)search:(NSString *)searchString 
{
    [self.discogsApi searchForArtist:searchString 
                        onCompletion:^(NSArray *artistList){
                            for (NSString *artist in artistList){
                                NSLog(@"%@",artist);
                            }
                                
                        }
                             onError:^(NSError* error) {
        
        NSLog(@"%@\t%@\t%@\t%@", [error localizedDescription], 
                                 [error localizedFailureReason], 
                                 [error localizedRecoveryOptions], 
                                 [error localizedRecoverySuggestion]);
    }];   
    
}

@end
