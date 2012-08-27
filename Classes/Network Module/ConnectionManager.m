//
//  ConnectionManager.m
//  HONetwork Module
//
//  Created by abhishek chatterjee on 03/01/12.
//  Copyright 2012 a. All rights reserved.
//

#import "ConnectionManager.h"
static ConnectionManager *sSharedConnectionManager = nil;


@implementation ConnectionManager
#pragma mark -
#pragma mark - Singleton Methods

+ (ConnectionManager *)sharedConnectionManager
{
	if (sSharedConnectionManager == NULL)
	{
		sSharedConnectionManager = [[self alloc] init];
	}
	
	return sSharedConnectionManager;
}

- (id)retain
{
    return self;
}


- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (oneway void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

- (id) init
{
	self = [super init];
	if (self != nil) 
	{
		mConnections = [[NSMutableDictionary alloc] init];

	}
	return self;
}

- (void) dealloc
{
	[mConnections release];
	[super dealloc];
}



-(void)addConnectionRequest:(SBNSURLConnection *)inRequest withConnectionIdentifier:(NSString*)inIdentifier
{
    @synchronized(self)
	{
		[mConnections setObject:inRequest forKey:inIdentifier];
	}
}

-(void)cancelAllconnections
{
	@synchronized(self)
	{
#if !USE_NSURL_WRAPPER
        [[mConnections allValues] makeObjectsPerformSelector:@selector(clearDelegatesAndCancel)];
		[mConnections removeAllObjects];
#else
        [[mConnections allValues] makeObjectsPerformSelector:@selector(cancellAndClearDelegate)];
		[mConnections removeAllObjects];
#endif
	}
}

-(void)canceltheConnectionWithconnectionIdentifier:(NSString*)inIdentifier
{
	@synchronized(self)
	{
		if(nil != inIdentifier)
		{
#if !USE_NSURL_WRAPPER
            ASIHTTPRequest *request = [mConnections objectForKey:inIdentifier];
			[mConnections removeObjectForKey:inIdentifier];
			[request clearDelegatesAndCancel];
#else
            SBNSURLConnection *request = [mConnections objectForKey:inIdentifier];
            [mConnections removeObjectForKey:inIdentifier];
            [request cancellAndClearDelegate];
#endif
        }
	}
}

-(void)removeRequestWithIdentifier:(NSString*)inIdentifier
{
	@synchronized(self)
	{
		if(nil != inIdentifier)
		{
			[mConnections removeObjectForKey:inIdentifier];
		}
	}
}


@end
