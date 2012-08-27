//
//  DataTranslator.h
//  HONetwork Module
//
//  Created by abhishek chatterjee on 03/01/12.
//  Copyright 2012 a. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBNSURLConnection.h"

@interface DataTranslator : NSObject 
{

}
+ (NSMutableDictionary *)getparsedJSONDataForRequest:(SBNSURLConnection*)inRequest error:(NSError**)outError;
@end
