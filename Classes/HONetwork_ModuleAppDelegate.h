//
//  HONetwork_ModuleAppDelegate.h
//  HONetwork Module
//
//  Created by abhishek chatterjee on 17/10/11.
//  Copyright 2011 a. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HONetwork_ModuleAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

