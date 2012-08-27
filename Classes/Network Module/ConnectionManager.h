//
//  ConnectionManager.h
//  HONetwork Module
//
//  Created by abhishek chatterjee on 03/01/12.
//  Copyright 2012 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBNSURLConnection.h"

@interface ConnectionManager : NSObject 
{
	NSMutableDictionary *mConnections;

}
+ (ConnectionManager *)sharedConnectionManager;

-(void)addConnectionRequest:(SBNSURLConnection *)inRequest withConnectionIdentifier:(NSString*)inIdentifier;

-(void)removeRequestWithIdentifier:(NSString*)inIdentifier;
-(void)cancelAllconnections;
-(void)canceltheConnectionWithconnectionIdentifier:(NSString*)inIdentifier;
@end
