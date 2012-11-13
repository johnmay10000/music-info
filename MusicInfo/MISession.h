//
//  MISession.h
//  MusicInfo
//
//  Created by John May on 12/12/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MIDiscogsApi;
@class MISoundcloudApi;
@class MIRdioApi;

@interface MISession : NSObject
@property (nonatomic, strong) NSMutableArray *searchResults;
@property (nonatomic, strong) MIDiscogsApi *discogsApi;
@property (nonatomic, strong) MISoundcloudApi *soundcloudApi;
@property (nonatomic, strong) MIRdioApi *rdio;

-(void)start;
-(void)searchFor:(NSString *)searchString withType:(NSString *)searchType;
@end
