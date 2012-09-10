//
//  SneakyJoystickSkinnedDPadExample.m
//  SneakyJoystick
//
//  Created by CJ Hanson on 2/18/10.
//  Copyright 2010 Hanson Interactive. All rights reserved.
//

#import "SneakyJoystickSkinnedDPadExample.h"
#import "cocos2d.h"
#import "SneakyJoystick.h"

@implementation SneakyJoystickSkinnedDPadExample


- (id) init
{
	self = [super init];
	if(self != nil){
		self.backgroundSprite = [CCSprite spriteWithFile:@"DPad_BG.png"];
		
		self.joystick = [[SneakyJoystick alloc] initWithRect:CGRectMake(0.0f, 0.0f, contentSize_.width, contentSize_.height)];
		joystick.thumbRadius = 0.0f;
		joystick.isDPad = YES;
		joystick.numberOfDirections = 8;
	}
	return self;
}

@end
