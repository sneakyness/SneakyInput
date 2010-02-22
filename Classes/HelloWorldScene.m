//
// cocos2d Hello World example
// http://www.cocos2d-iphone.org
//

// Import the interfaces
#import "HelloWorldScene.h"
#import "SneakyJoystick.h"
#import "SneakyJoystickSkinnedJoystickExample.h"
#import "SneakyJoystickSkinnedDPadExample.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "ColoredCircleSprite.h"

@interface HelloWorld (privateMethods)
-(void)applyJoystick:(SneakyJoystick *)aJoystick toNode:(CCNode *)aNode forTimeDelta:(float)dt;
@end

// HelloWorld implementation
@implementation HelloWorld

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorld *layer = [HelloWorld node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		// ask director the the window size
		self.isTouchEnabled = YES;
		
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		text = [CCLabel labelWithString:@"Hello World" fontName:@"Helvetica" fontSize:64];
		text.position =  ccp( size.width /2 , size.height/2 );
		[self addChild: text];
		
		SneakyJoystickSkinnedBase *leftJoy = [[[SneakyJoystickSkinnedBase alloc] init] autorelease];
		leftJoy.position = ccp(64,64);
		leftJoy.backgroundSprite = [ColoredCircleSprite circleWithColor:ccc4(255, 0, 0, 128) radius:64];
		leftJoy.thumbSprite = [ColoredCircleSprite circleWithColor:ccc4(0, 0, 255, 200) radius:32];
		leftJoy.joystick = [[SneakyJoystick alloc] initWithRect:CGRectMake(0,0,128,128)];
		leftJoystick = [leftJoy.joystick retain];
		[self addChild:leftJoy];
		
		SneakyButtonSkinnedBase *rightBut = [[[SneakyButtonSkinnedBase alloc] init] autorelease];
		rightBut.position = ccp(448,32);
		rightBut.defaultSprite = [ColoredCircleSprite circleWithColor:ccc4(255, 255, 255, 128) radius:32];
		rightBut.activatedSprite = [ColoredCircleSprite circleWithColor:ccc4(255, 255, 255, 255) radius:32];
		rightBut.pressSprite = [ColoredCircleSprite circleWithColor:ccc4(255, 0, 0, 255) radius:32];
		rightBut.button = [[SneakyButton alloc] initWithRect:CGRectMake(0, 0, 64, 64)];
		rightButton = [rightBut.button retain];
		rightButton.isToggleable = YES;
		[self addChild:rightBut];
		
		[[CCDirector sharedDirector] setAnimationInterval:1.0f/60.0f];
		
		[self schedule:@selector(tick:) interval:1.0f/120.0f];
	}
	return self;
}

-(void)tick:(float)delta {
	if (rightButton.active == YES){
		text.color = ccc3(255, 0, 0);
	}
	else {
		text.color = ccc3(255,255,255);
	}
	
	if (rightButton.value == 1){
		text.opacity = 64;
	}
	else {
		text.opacity = 255;
	}

	[self applyJoystick:leftJoystick toNode:text forTimeDelta:delta];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

	//function to apply a velocity to a position with delta
static CGPoint applyVelocity(CGPoint velocity, CGPoint position, float delta){
	return CGPointMake(position.x + velocity.x * delta, position.y + velocity.y * delta);
}

-(void)applyJoystick:(SneakyJoystick *)aJoystick toNode:(CCNode *)aNode forTimeDelta:(float)dt
{
		// you can create a velocity specific to the node if you wanted, just supply a different multiplier
		// which will allow you to do a parallax scrolling of sorts
	CGPoint scaledVelocity = ccpMult(aJoystick.velocity, 480.0f); 
	
		// apply the scaled velocity to the position over delta
	aNode.position = applyVelocity(scaledVelocity, aNode.position, dt);
}
@end
