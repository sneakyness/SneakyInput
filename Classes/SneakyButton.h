//
//  button.h
//  Classroom Demo
//
//  Created by Nick Pannuto on 2/10/10.
//  Copyright 2010 Sneakyness, llc.. All rights reserved.
//

#import "cocos2d.h"

#ifdef __CC_PLATFORM_IOS
@interface SneakyButton : CCNode <CCTargetedTouchDelegate> {
#elif defined (__CC_PLATFORM_MAC)
@interface SneakyButton : CCNode <CCMouseEventDelegate> {
#endif

	CGPoint center;
	
	float radius;
	float radiusSq;
	
	CGRect bounds;
	BOOL active;
	BOOL status;
	BOOL value;
	BOOL isHoldable;
	BOOL isToggleable;
	float rateLimit;
}

@property (nonatomic, assign) BOOL status;
@property (nonatomic, readonly) BOOL value;
@property (nonatomic, readonly) BOOL active;
@property (nonatomic, assign) BOOL isHoldable;
@property (nonatomic, assign) BOOL isToggleable;
@property (nonatomic, assign) float rateLimit;

//Optimizations (keep Squared values of all radii for faster calculations) (updated internally when changing radii)
@property (nonatomic, assign) float radius;

-(id)initWithRect:(CGRect)rect;

@end
