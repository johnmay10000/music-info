//
//  HttpClient.m
//  MusicInfo
//
//  Created by John May on 24/10/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpClient
- (HttpClient *)initWithApi:(PXApi *)api {
    if ((self = [super init])) {
        apiBase = api;
    }
    return self;
}

- (FKEither *)getTo:(NSString *)path parameters:(NSDictionary *)parameters {
    //NSDictionary *params = [self appendToMetadata:parameters];
//    LOG(@"GET: %@ params=%@", path, params);
    FKEither *e = [apiBase getApiCallToAction:path parameters:parameters];
    FKEither *f = [e.right bind:functionS(parseAsJson)];
    return [f.right bind:functionTS(self, checkResponseCode:)];
}

//- (FKEither *)postTo:(NSString *)path parameters:(NSDictionary *)parameters {
    //NSString *metadataQueryString = [PXHttp queryStringFromDictionary:[HttpClient deviceMetadata]];
    //NSString *enhancedPath = SWF(@"%@?%@", path, metadataQueryString);
    
//    LOG(@"POST: %@ params=%@", enhancedPath, parameters);
//    return [self doPostTo:enhancedPath bodyParameters:parameters];
//}


- (FKEither *)getApiCallToAction:(NSString *)action parameters:(NSDictionary *)parameters {
    NSURL *url = [self buildUrlUsingAction:action parameters:parameters];
    if (traceCalls) {
        NSLog(@"TRACE API >>> GET %@", url);
    }
    ASIHTTPRequest *request = [[[ASIHTTPRequest alloc] initWithURL:url] autorelease];
    return [self executeApiRequest:request];
}

- (NSURL *)buildUrlUsingAction:(NSString *)action parameters:(NSDictionary *)parameters {
    NSString *queryString = [PXHttp queryStringFromDictionary:parameters];
    NSString *queryStringGlue = [action contains:@"?"] ? @"&" : @"?"; // action may contain a ? already if it includes the method name
    NSString *url = [NSString stringWithFormat:@"%@%@%@%@", [self rootUrl], action, queryStringGlue, queryString];
    return [NSURL URLWithString:url];
}

- (FKEither *)executeApiRequest:(ASIHTTPRequest *) request  {
    [request setTimeOutSeconds:60.0f];
    [request startSynchronous];
    if ([request error]) {
        return [FKEither leftWithValue:[request error]];
    } else {
        NSString *responseBody = [NSString stringWithData:[request responseData]];
        if (traceCalls) {
            NSLog(@"TRACE API <<< %@", responseBody);
        }
        return [FKEither rightWithValue:responseBody];
    }
}

- (FKEither *)parseAndCheck:(FKEither *)input {
    return [input.right bind:functionS(parseAsJson)];
}


- (FKEither *)parseAsJson {
    NSError *error;
	SBJSON *parser = [SBJSON new];
	id parsedObject = [parser objectWithString:self error:&error];
	[parser release];
    return [[FKOption fromNil:parsedObject] toEither:error];
}

@end
