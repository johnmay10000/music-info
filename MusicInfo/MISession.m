//
//  MISession.m
//  MusicInfo
//
//  Created by John May on 12/12/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import "MISession.h"

@implementation MISession

-(void)start 
{
    NSMutableDictionary *headerFields = [NSMutableDictionary dictionary]; 
    [headerFields setValue:@"iOS" forKey:@"x-client-identifier"];

    self.discogsApi = [[MIDiscogApi alloc] initWithHostName:@"api.discogs.com" 
                    customHeaderFields:headerFields];
}

@end
