//
//  HttpClient.h
//  MusicInfo
//
//  Created by John May on 24/10/11.
//  Copyright (c) 2011 John May. All rights reserved.
//



@interface HttpClient : NSObject {
    PXApi *apiBase;
}
 
- (FKEither *)getTo:(NSString *)path parameters:(NSDictionary *)parameters;
//- (FKEither *)postTo:(NSString *)path parameters:(NSDictionary *)parameters;

- (HttpClient *)initWithApi:(PXApi *)api;

@end


