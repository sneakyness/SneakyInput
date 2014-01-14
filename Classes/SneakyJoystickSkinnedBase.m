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
		
		[self schedule:@selector(updatePositions) interval:1.0f/60.0f];
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
	[super setContentSize:s];
	backgroundSprite.contentSize = s;
    backgroundSprite.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
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
        thumbSprite.position = ccp(self.contentSize.width/2, self.contentSize.height/2);

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

/*
-(void) draw
{
    [super draw];
    ccDrawCircle(self.anchorPointInPoints, 20, 0, 8, YES);
    CGRect rect = [self boundingBox];
    CGPoint vertices[4]={
        ccp(rect.origin.x,rect.origin.y),
        ccp(rect.origin.x+rect.size.width,rect.origin.y),
        ccp(rect.origin.x+rect.size.width,rect.origin.y+rect.size.height),
        ccp(rect.origin.x,rect.origin.y+rect.size.height),
    };
    ccDrawPoly(vertices, 4, YES);
}
*/

@end
