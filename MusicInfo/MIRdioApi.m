//
//  MIRdioApi.m
//  MusicInfo
//
//  Created by John May on 13/11/12.
//  Copyright (c) 2012 John May. All rights reserved.
//

#import "MIRdioApi.h"

@implementation MIRdioApi

-(id)init
{
    if((self = [super init]))
    {
        NSString *developerKey = @"8sgrekyj2xeu94uzjxqjcfyf";
        NSString *developerSecret = @"3AdwHXvmNs";
    
        _rdio = [[Rdio alloc] initWithConsumerKey:developerKey andSecret:developerSecret delegate:self];
//        [_rdio.player playSource:@"t2742133"];
    }
    return self;
}
-(void)searchUsing:(NSString *)search
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:search, @"query",@"album",@"types", nil];
    [_rdio callAPIMethod:@"search" withParameters:params delegate:self];
}


#pragma mark -
#pragma mark RDAPIRequestDelegate
/**
 * Our API call has returned successfully.
 * the data parameter can be an NSDictionary, NSArray, or NSData
 * depending on the call we made.
 *
 * Here we will inspect the parameters property of the returned RDAPIRequest
 * to see what method has returned.
 */
- (void)rdioRequest:(RDAPIRequest *)request didLoadData:(id)data {
    NSDictionary *dict = [NSDictionary dictionaryWithDictionary:data];
    NSLog(@"%@",dict);
//    NSString *method = [request.parameters objectForKey:@"method"];
//    if([method isEqualToString:@"getHeavyRotation"]) {
//        if(albums != nil) {
//            [albums release];
//            albums = nil;
//        }
//        albums = [[NSMutableArray alloc] initWithArray:data];
//        [self getTrackKeysForAlbums];
//    }
//    else if([method isEqualToString:@"get"]) {
//        // we are returned a dictionary but it will be easier to work with an array
//        // for our needs
//        [albums release];
//        albums = [[NSMutableArray alloc] initWithCapacity:[data count]];
//        for(NSString *key in [data allKeys]) {
//            [albums addObject:[data objectForKey:key]];
//        }
//        [self loadAlbumChoices];
//    }
}

- (void)rdioRequest:(RDAPIRequest *)request didFailWithError:(NSError*)error {
    NSLog(@"%@",error);
}


#pragma mark -
#pragma mark RdioDelegate

- (void)rdioDidAuthorizeUser:(NSDictionary *)user withAccessToken:(NSString *)accessToken
{
    
}

- (void)rdioAuthorizationFailed:(NSString *)error
{
    
}

/**
 * Called if the user aborts the authorization process.
 */
- (void)rdioAuthorizationCancelled
{
    
}

/**
 * Called when logout completes.
 */
-(void)rdioDidLogout
{
    
}

@end
