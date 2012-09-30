//
//  SneakyInput_0_4_0AppDelegate.h
//  SneakyInput 0.4.0
//
//  Created by Nick Pannuto on 12/3/10.
//  Copyright Sneakyness, llc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "CCNavigationViewController.h"

@interface SneakyInput_0_4_0AppDelegate : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
}

@property (nonatomic, strong) UIWindow *window;
@property (readonly) CCNavigationViewController *navController;
@property (weak, readonly) CCDirectorIOS *director;

@end
