//
//  joystick.h
//  SneakyJoystick
//
//  Created by Nick Pannuto.
//  2/15/09 verion 0.1
//  
//  WIKI: http://wiki.github.com/sneakyness/SneakyJoystick/
//  HTTP SRC: http://github.com/sneakyness/SneakyJoystick.git
//  GIT: git://github.com/sneakyness/SneakyJoystick.git
//  Email: SneakyJoystick@Sneakyness.com 
//  IRC: #cocos2d-iphone irc.freenode.net

#import "cocos2d.h"

#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
@interface SneakyJoystick : CCNode <CCTargetedTouchDelegate> {
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
@interface SneakyJoystick : CCNode {
#endif
	
	CGPoint stickPosition;
	float degrees;
	CGPoint velocity;
	BOOL autoCenter;
	BOOL isDPad;
	BOOL hasDeadzone; //Turns Deadzone on/off for joystick, always YES if ifDpad == YES
	NSUInteger numberOfDirections; //Used only when isDpad == YES
	
	float joystickRadius;
	float thumbRadius;
	float deadRadius; //Size of deadzone in joystick (how far you must move before input starts). Automatically set if isDpad == YES
	
	//Optimizations (keep Squared values of all radii for faster calculations) (updated internally when changing joy/thumb radii)
	float joystickRadiusSq;
	float thumbRadiusSq;
	float deadRadiusSq;
}

@property (nonatomic, readonly) CGPoint stickPosition;
@property (nonatomic, readonly) float degrees;
@property (nonatomic, readonly) CGPoint velocity;
@property (nonatomic, assign) BOOL autoCenter;
@property (nonatomic, assign) BOOL isDPad;
@property (nonatomic, assign) BOOL hasDeadzone;
@property (nonatomic, assign) NSUInteger numberOfDirections;

@property (nonatomic, assign) float joystickRadius;
@property (nonatomic, assign) float thumbRadius;
@property (nonatomic, assign) float deadRadius;

-(id)initWithRect:(CGRect)rect;

@end
