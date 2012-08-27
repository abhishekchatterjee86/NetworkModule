//
//  WebEngine.h
//  HONetwork Module
//
//  Created by abhishek chatterjee on 03/01/12.
//  Copyright 2012 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@interface WebEngine : NSObject <NSURLConnectionDataDelegate, NSURLConnectionDelegate>
{
    id mDelegate;
}

@property (nonatomic, assign) id delegate;

+ (WebEngine *)defaultWebEngine;
- (void)cancelAllconnections;
- (void)canceltheConnectionWithconnectionIdentifier:(NSString*)inIdentifier;

- (NSString*)sendLoginRequestwithInfo:(NSDictionary*)inDict withObserver:(id)inOberver;

@end
