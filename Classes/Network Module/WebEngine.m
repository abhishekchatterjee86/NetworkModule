//
//  WebEngine.m
//  HONetwork Module
//
//  Created by abhishek chatterjee on 03/01/12.
//  Copyright 2012 a. All rights reserved.
//

#import "WebEngine.h"
#import "ConnectionManager.h"
#import "WebEngineDelegate.h"
#import "DataTranslator.h"
#import "SBJSON.h"
#import "StringConstants.h"
#import "NSStringAdditions.h"
#import "SBNSURLConnection.h"

NSString *const kSenderObject = @"sender";
NSString *const kRequestObject = @"request";
NSString *const kContextInfoKey = @"contextInfo";

static WebEngine *sDefaultWebEngine = nil;

@interface WebEngine (Private)

- (NSString *)sendPOSTRequestToWebServer:(NSString*)relativePath 
										body:(NSData*)requestBody 
								 requestType:(eHOWebRequestType)requestType 
									  sender:(NSObject<WebEngineDelegate>*)sender 
								 contextInfo:(id)contextInfo; 

- (NSString *)sendGETRequestToWebServer:(NSString*)relativePath 
                              withParam:(NSDictionary*)inParam 
                            requestType:(eHOWebRequestType)requestType 
                                 sender:(NSObject<WebEngineDelegate>*)sender 
                            contextInfo:(id)contextInfo;

- (NSString *)sendMultipartPOSTRequestToWebServer:(NSString*)relativePath 
                                             body:(NSData*)requestBody 
                                      requestType:(eHOWebRequestType)requestType 
                                           sender:(NSObject<WebEngineDelegate>*)sender 
                                      contextInfo:(id)contextInfo;
@end

@implementation WebEngine (Private)

- (NSString *)sendPOSTRequestToWebServer:(NSString*)relativePath 
										body:(NSData*)requestBody 
								 requestType:(eHOWebRequestType)requestType 
									  sender:(NSObject<WebEngineDelegate>*)sender 
								 contextInfo:(id)contextInfo 
{
    NSString *the_connectionID = nil;

    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@",KBASEURL, relativePath];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:200];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:(NSMutableData*)requestBody];
    [urlString release];
    
    if (theRequest) 
    {
        the_connectionID = [NSString stringByGeneratingUUID];
        
        SBNSURLConnection *testConn = [[SBNSURLConnection alloc] initWithRequest:theRequest delegate:self startImmediately:YES andConnectionIdentifier:the_connectionID];
        [[ConnectionManager sharedConnectionManager] addConnectionRequest:testConn withConnectionIdentifier:the_connectionID ];
        
        @synchronized (self)
		{
			[testConn start];
		}
    }
    
    return the_connectionID;
}

- (NSString *)sendGETRequestToWebServer:(NSString*)relativePath 
									withParam:(NSDictionary*)inParam 
							 requestType:(eHOWebRequestType)requestType 
								  sender:(NSObject<WebEngineDelegate>*)sender 
							 contextInfo:(id)contextInfo 
{
	

	NSString *the_connectionID = nil;;
	
	 return the_connectionID;
}

- (NSString *)sendMultipartPOSTRequestToWebServer:(NSString*)relativePath 
									body:(NSData*)requestBody 
							 requestType:(eHOWebRequestType)requestType 
								  sender:(NSObject<WebEngineDelegate>*)sender 
							 contextInfo:(id)contextInfo 
{
	

	NSString *the_connectionID = nil;;
	return the_connectionID;
}

@end

@implementation WebEngine

@synthesize delegate = mDelegate;

#pragma mark -
#pragma mark - Singleton Methods

+ (WebEngine *)defaultWebEngine
{
	if (sDefaultWebEngine == NULL)
	{
		sDefaultWebEngine = [[self alloc] init];
	}
	
	return sDefaultWebEngine;
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

	}
	return self;
}

- (void) dealloc
{
	
	[super dealloc];
}

#pragma mark -
#pragma mark - Public Methods -

-(NSString*)sendLoginRequestwithInfo:(NSDictionary*)inDict withObserver:(id)inOberver
{
	NSString *the_relativeURL = @"Mygarden.txt";
	SBJSON *jsonParser = [SBJSON new];
	NSString *the_loginINput = [jsonParser stringWithObject:inDict];
	NSData *the_data = [the_loginINput dataUsingEncoding:NSUTF8StringEncoding];
	NSString *the_connectionID = [self sendPOSTRequestToWebServer:the_relativeURL body:the_data requestType:eLoginQuery sender:inOberver contextInfo:nil];
    self.delegate = inOberver;
	[jsonParser release];
	return the_connectionID;
}

-(void)cancelAllconnections
{
    [[ConnectionManager sharedConnectionManager] cancelAllconnections];	
}

-(void)canceltheConnectionWithconnectionIdentifier:(NSString*)inIdentifier
{
    [[ConnectionManager sharedConnectionManager] canceltheConnectionWithconnectionIdentifier:inIdentifier];	
}

#pragma mark -
#pragma mark - NSURLConnectionDelegate - 

- (void)connection:(SBNSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"IS Main Thread:%d",[NSThread isMainThread]);
    NSLog(@"Called didFailWithError: Error Code:%d",[error code]);
    [[ConnectionManager sharedConnectionManager] removeRequestWithIdentifier:connection.connectionID];
    [connection release];
    
    if([self.delegate respondsToSelector:@selector(webEnginedidfinishWithData: forRequest:)]) 
	{
		[self.delegate webEnginedidFailtoRecevieDataWithInfo:nil forRequest:connection];
	}
}

- (void)connection:(SBNSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Called didReceiveResponse");
    int statusCode = [((NSHTTPURLResponse *)response) statusCode];
    NSDictionary *allHeaderFields = [((NSHTTPURLResponse *)response) allHeaderFields];
    NSString *url = [[response URL] absoluteString];
    NSLog(@"Status Code:%d and Header Fields:%@ and URL:%@",statusCode,allHeaderFields,url);
    [connection.receivedData setLength:0];
}

- (void)connection:(SBNSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"IS Main Thread:%d",[NSThread isMainThread]);
    NSLog(@"Called didReceiveData:%d",[data length]);
    [connection.receivedData appendData:data];
}

- (void)connection:(SBNSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    NSLog(@"Called didSendBodyData:Total Bytes:%d Bytes Written:%d",totalBytesWritten,bytesWritten);
}

- (void)connectionDidFinishLoading:(SBNSURLConnection *)connection 
{
    NSLog(@"IS Main Thread:%d",[NSThread isMainThread]);
    NSLog(@"Called connectionDidFinishLoading");
    
    NSString *errorDescription = nil;
    NSPropertyListFormat format;
    NSDictionary *response = [NSPropertyListSerialization propertyListFromData:[connection receivedData] mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&errorDescription];
    NSLog(@"response:%@ of Length:%d",response,[[connection receivedData] length]);
    [[ConnectionManager sharedConnectionManager] removeRequestWithIdentifier:connection.connectionID];
    
    if([self.delegate respondsToSelector:@selector(webEnginedidfinishWithData: forRequest:)]) 
    {
        [self.delegate webEnginedidfinishWithData:response forRequest:connection];
    }
}

@end
