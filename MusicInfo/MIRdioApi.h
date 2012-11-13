//
//  MIRdioApi.h
//  MusicInfo
//
//  Created by John May on 13/11/12.
//  Copyright (c) 2012 John May. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Rdio/Rdio.h>
@interface MIRdioApi : NSObject <RDAPIRequestDelegate, RdioDelegate>{
}

@property (readonly) Rdio *rdio;

-(void)searchUsing:(NSString *)search;
@end
