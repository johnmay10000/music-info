//
//  MIAppDelegate.h
//  MusicInfo
//
//  Created by John May on 14/09/11.
//  Copyright (c) 2011 John May. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Rdio/Rdio.h>
#import "MISession.h"
@interface MIAppDelegate : UIResponder <UIApplicationDelegate> {
//    Rdio *rdio;
}

@property (strong, nonatomic) UIWindow *window;
@property (readonly) Rdio *rdio;
@end
