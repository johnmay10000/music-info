//
//  MIDiscogsResult.h
//  MusicInfo
//
//  Created by John May on 20/05/12.
//  Copyright (c) 2012 John May. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MIDiscogsResult : NSObject
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *resourceUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *uri;
@property (nonatomic, strong) NSString *type;
@property (nonatomic) NSInteger discog_id;

- (id)initWithResultsDict:(NSDictionary *)result;
@end
