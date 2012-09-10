//
//  SneakyJoystickSkinnedJoystickExample.m
//  SneakyJoystick
//
//  Created by CJ Hanson on 2/18/10.
//  Copyright 2010 Hanson Interactive. All rights reserved.
//

#import "SneakyJoystickSkinnedJoystickExample.h"
#import "cocos2d.h"
#import "SneakyJoystick.h"
#import "ColoredCircleSprite.h"

@implementation SneakyJoystickSkinnedJoystickExample


- (id) init
{
	self = [super init];
	if(self != nil){
		self.backgroundSprite = [ColoredCircleSprite circleWithColor:ccc4(255, 0, 0, 128) radius:100];
		self.thumbSprite = [ColoredCircleSprite circleWithColor:ccc4(0, 0, 255, 200) radius:30];
		
		self.joystick = [[SneakyJoystick alloc] initWithRect:CGRectMake(0.0f, 0.0f, contentSize_.width, contentSize_.height)];
	}
	return self;
}

@end
