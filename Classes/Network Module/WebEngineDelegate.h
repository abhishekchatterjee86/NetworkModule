//
//  WebEngineDelegate.h
//  HONetwork Module
//
//  Created by abhishek chatterjee on 03/01/12.
//  Copyright 2012 a. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBNSURLConnection.h"

@class WebEngine;

@protocol WebEngineDelegate <NSObject>

-(void)webEnginedidfinishWithData:(NSDictionary*)inDict forRequest:(SBNSURLConnection*)inRequest;
-(void)webEnginedidFailtoRecevieDataWithInfo:(NSDictionary*)inDict forRequest:(SBNSURLConnection*)inRequest;

@end
