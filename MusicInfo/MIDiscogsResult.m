//
//  MIDiscogsResult.m
//  MusicInfo
//
//  Created by John May on 20/05/12.
//  Copyright (c) 2012 John May. All rights reserved.
//

#import "MIDiscogsResult.h"

@implementation MIDiscogsResult
@synthesize discog_id;
@synthesize thumbUrl;
@synthesize resourceUrl;
@synthesize title;
@synthesize type;
@synthesize uri;

- (id)initWithResultsDict:(NSDictionary *)result
{
    if ((self = [super init])) {
        thumbUrl = [result objectForKey:@"thumb"];
        discog_id = (int)[result objectForKey:@"id"];
        resourceUrl = [result objectForKey:@"resource_url"];
        title = [result objectForKey:@"title"];
        type = [result objectForKey:@"type"];
        uri = [result objectForKey:@"uri"];
        
    }
    return self;
}

@end
