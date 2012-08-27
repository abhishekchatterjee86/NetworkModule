//
//  SBNSURLConnection.m
//  NSURLConnectionDownloadSample
//
//  Created by Abhishek chatterjee on 13/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBNSURLConnection.h"

@implementation SBNSURLConnection

@synthesize receivedData = mReceivedData;
@synthesize connectionID = mConnectionID;

@synthesize delegate = mDelegate;

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately andConnectionIdentifier:(NSString *)connectionIdentifier 
{
    self = [super initWithRequest:request delegate:delegate startImmediately:(BOOL)startImmediately];
    if (self) 
    {
        NSLog(@"URL:%@",[[request URL] absoluteString]);
        self.receivedData = [[NSMutableData alloc] initWithLength:0];
        self.delegate = delegate;
        self.connectionID = connectionIdentifier;
    }
    
    return self;
}

-(void)cancellAndClearDelegate
{
    [self cancel];
    self.delegate = nil;
}

- (void)dealloc 
{
    self.receivedData = nil;
    self.connectionID = nil;
    [super dealloc];
}

@end