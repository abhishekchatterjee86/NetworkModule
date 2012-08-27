//
//  SBNSURLConnection.h
//  NSURLConnectionDownloadSample
//
//  Created by Abhishek chatterjee on 13/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SBNSURLConnection : NSURLConnection
{
    NSMutableData *mReceivedData;
    NSString *mConnectionID;
    id mDelegate;
}

@property (nonatomic, retain) NSString *connectionID;
@property (retain) NSMutableData *receivedData;

@property (nonatomic, assign) id delegate;

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately andConnectionIdentifier:(NSString *)connectionIdentifier;

-(void)cancellAndClearDelegate;

@end
