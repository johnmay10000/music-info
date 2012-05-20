//
//  NSString+URLEncoding.h
//  MusicInfo
//
//  Created by John May on 20/05/12.
//  Copyright (c) 2012 John May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncoding)
-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;
@end
