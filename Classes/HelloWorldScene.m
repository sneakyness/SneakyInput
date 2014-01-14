//
//  HelloWorldLayer.m
//  SneakyInput 0.4.0
//
//  Created by Nick Pannuto on 12/3/10.
//  Copyright Sneakyness, llc. 2010. All rights reserved.
//

// Import the interfaces
#import "HelloWorldScene.h"
#import "SneakyJoystick.h"
#import "SneakyJoystickSkinnedJoystickExample.h"
#import "SneakyJoystickSkinnedDPadExample.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "ColoredCircleSprite.h"

// HelloWorld implementation
@implementation HelloWorld

+ (HelloWorld *)scene;
{
	return [[self alloc] init];
}


// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
        
        // Create a colored background (Dark Grey)
        CCNodeColor *background = [CCNodeColor nodeWithColor:[CCColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:1.0f]];
        [self addChild:background];

		
		SneakyJoystickSkinnedBase *leftJoy = [[SneakyJoystickSkinnedBase alloc] init];
		leftJoy.position = ccp(64,64);
        leftJoy.backgroundSprite = [ColoredCircleSprite circleWithColor:[CCColor colorWithRed:1 green:0 blue:0 alpha:0.5] radius:64];
        leftJoy.thumbSprite = [ColoredCircleSprite circleWithColor:[CCColor colorWithRed:0 green:0 blue:1 alpha:0.8f] radius:32];
		leftJoy.joystick = [[SneakyJoystick alloc] initWithRect:CGRectMake(0,0,128,128)];
		leftJoystick = leftJoy.joystick;
		[self addChild:leftJoy];
		
		SneakyButtonSkinnedBase *rightBut = [[SneakyButtonSkinnedBase alloc] init];
		rightBut.position = ccp(256,32);
        rightBut.defaultSprite = [ColoredCircleSprite circleWithColor:[CCColor colorWithRed:0.5 green:1 blue:0.5 alpha:0.5f] radius:32];
        rightBut.activatedSprite = [ColoredCircleSprite circleWithColor:[CCColor colorWithRed:1 green:1 blue:1 alpha:1] radius:32];
        rightBut.pressSprite = [ColoredCircleSprite circleWithColor:[CCColor colorWithRed:1 green:0 blue:0 alpha:1] radius:32];
		rightBut.button = [[SneakyButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
		rightButton = rightBut.button;
		rightButton.isToggleable = YES;
		[self addChild:rightBut];
		
		[[CCDirector sharedDirector] setAnimationInterval:1.0f/60.0f];
		
			//[self schedule:@selector(tick:) interval:1.0f/120.0f];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
@end
