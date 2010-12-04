//
//  HelloWorldLayer.h
//  SneakyInput 0.4.0
//
//  Created by Nick Pannuto on 12/3/10.
//  Copyright Sneakyness, llc. 2010. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class SneakyJoystick;
@class SneakyButton;

// HelloWorld Layer
@interface HelloWorld : CCLayer
{
	SneakyJoystick *leftJoystick;
	SneakyButton *rightButton;
}

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
