
// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class SneakyJoystick;
@class SneakyButton;

// HelloWorld Layer
@interface HelloWorld : CCLayer
{
	SneakyJoystick *leftJoystick;
	SneakyButton *rightButton;
	CCLabel *text;
}

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
