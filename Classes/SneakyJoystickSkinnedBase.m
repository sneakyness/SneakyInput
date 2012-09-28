//
//  SneakyJoystickSkinnedBase.m
//  SneakyJoystick
//
//  Created by CJ Hanson on 2/18/10.
//  Copyright 2010 Hanson Interactive. All rights reserved.
//

#import "SneakyJoystickSkinnedBase.h"
#import "SneakyJoystick.h"

@implementation SneakyJoystickSkinnedBase

@synthesize backgroundSprite, thumbSprite, joystick;


- (id) init
{
	self = [super init];
	if(self != nil){
		self.backgroundSprite = nil;
		self.thumbSprite = nil;
		self.joystick = nil;
		
		[self schedule:@selector(updatePositions)];
	}
	return self;
}

- (void) updatePositions
{
	if(joystick && thumbSprite)
		[thumbSprite setPosition:joystick.stickPosition];
}

- (void) setContentSize:(CGSize)s
{
	contentSize_ = s;
	backgroundSprite.contentSize = s;
	joystick.joystickRadius = s.width/2;
}

- (void) setBackgroundSprite:(CCSprite *)aSprite
{
	if(backgroundSprite){
		if(backgroundSprite.parent)
			[backgroundSprite.parent removeChild:backgroundSprite cleanup:YES];
	}
	backgroundSprite = aSprite;
	if(aSprite){
		[self addChild:backgroundSprite z:0];
		
		[self setContentSize:backgroundSprite.contentSize];
	}
}

- (void) setThumbSprite:(CCSprite *)aSprite
{
	if(thumbSprite){
		if(thumbSprite.parent)
			[thumbSprite.parent removeChild:thumbSprite cleanup:YES];
	}
	thumbSprite = aSprite;
	if(aSprite){
		[self addChild:thumbSprite z:1];
		
		[joystick setThumbRadius:thumbSprite.contentSize.width/2];
	}
}

- (void) setJoystick:(SneakyJoystick *)aJoystick
{
	if(joystick){
		if(joystick.parent)
			[joystick.parent removeChild:joystick cleanup:YES];
	}
	joystick = aJoystick;
	if(aJoystick){
		[self addChild:joystick z:2];
		if(thumbSprite)
			[joystick setThumbRadius:thumbSprite.contentSize.width/2];
		else
			[joystick setThumbRadius:0];
		
		if(backgroundSprite)
			[joystick setJoystickRadius:backgroundSprite.contentSize.width/2];
	}
}

@end
