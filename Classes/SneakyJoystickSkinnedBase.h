//
//  SneakyJoystickSkinnedBase.h
//  SneakyJoystick
//
//  Created by CJ Hanson on 2/18/10.
//  Copyright 2010 Hanson Interactive. All rights reserved.
//

#import "cocos2d.h"

@class SneakyJoystick;

@interface SneakyJoystickSkinnedBase : CCSprite {
	CCSprite *backgroundSprite;
	CCSprite *thumbSprite;
	SneakyJoystick *joystick;
}

@property (nonatomic, strong) CCSprite *backgroundSprite;
@property (nonatomic, strong) CCSprite *thumbSprite;
@property (nonatomic, strong) SneakyJoystick *joystick;

- (void) updatePositions;

@end
