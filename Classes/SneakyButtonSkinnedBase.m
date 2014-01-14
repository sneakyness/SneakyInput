//
//  SneakyButtonSkinnedBase.m
//  SneakyInput
//
//  Created by Nick Pannuto on 2/19/10.
//  Copyright 2010 Sneakyness, llc.. All rights reserved.
//

#import "SneakyButtonSkinnedBase.h"
#import "SneakyButton.h"

@implementation SneakyButtonSkinnedBase

@synthesize defaultSprite, activatedSprite, disabledSprite, pressSprite, button;


- (id) init
{
	self = [super init];
	if(self != nil){
		self.defaultSprite = nil;
		self.activatedSprite = nil;
		self.disabledSprite = nil;
		self.pressSprite = nil;
		self.button = nil;
		
		[self schedule:@selector(watchSelf) interval:1.0f/60.0f];
	}
	return self;
}

- (void) watchSelf
{
	if (!self.button.status){
		if(disabledSprite){
			disabledSprite.visible = YES;
		}
		else {
			disabledSprite.visible = NO;
		}
	}
	else {
		if(!self.button.active){
			pressSprite.visible = NO;
			if(self.button.value == 0){
				activatedSprite.visible = NO;
				if(defaultSprite){
					defaultSprite.visible = YES;
				}
			}
			else {
				activatedSprite.visible = YES;
			}
		}
		else {
			defaultSprite.visible = NO;
			if(pressSprite){
				pressSprite.visible = YES;
			}
		}
	}
}

- (void) setContentSize:(CGSize)s
{
	[super setContentSize:s];
	//defaultSprite.contentSize = s;
    //defaultSprite.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
	button.radius = s.width/2;
}

- (void) setDefaultSprite:(CCSprite *)aSprite
{
	if(defaultSprite){
		if(defaultSprite.parent)
			[defaultSprite.parent removeChild:defaultSprite cleanup:YES];
	}
	defaultSprite = aSprite;
	if(aSprite){
		[self addChild:defaultSprite z:0];
		[self setContentSize:defaultSprite.contentSize];
        defaultSprite.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
	}
}

- (void) setActivatedSprite:(CCSprite *)aSprite
{
	if(activatedSprite){
		if(activatedSprite.parent)
			[activatedSprite.parent removeChild:activatedSprite cleanup:YES];
	}
	activatedSprite = aSprite;
	if(aSprite){
		[self addChild:activatedSprite z:1];
        activatedSprite.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
		
		[self setContentSize:activatedSprite.contentSize];
	}
}

- (void) setDisabledSprite:(CCSprite *)aSprite
{
	if(disabledSprite){
		if(disabledSprite.parent)
			[disabledSprite.parent removeChild:disabledSprite cleanup:YES];
	}
	disabledSprite = aSprite;
	if(aSprite){
		[self addChild:disabledSprite z:2];
        disabledSprite.position = ccp(self.contentSize.width/2, self.contentSize.height/2);

		[self setContentSize:disabledSprite.contentSize];
	}
}

- (void) setPressSprite:(CCSprite *)aSprite
{
	if(pressSprite){
		if(pressSprite.parent)
			[pressSprite.parent removeChild:pressSprite cleanup:YES];
	}
	pressSprite = aSprite;
	if(aSprite){
		[self addChild:pressSprite z:3];
        pressSprite.position = ccp(self.contentSize.width/2, self.contentSize.height/2);

		[self setContentSize:pressSprite.contentSize];
	}
}

- (void) setButton:(SneakyButton *)aButton
{
	if(button){
		if(button.parent)
			[button.parent removeChild:button cleanup:YES];
	}
	button = aButton;
	if(aButton){
		[self addChild:button z:4];
        button.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
		if(defaultSprite)
			[button setRadius:defaultSprite.contentSize.width/2];
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
