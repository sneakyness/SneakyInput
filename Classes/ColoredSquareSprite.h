#import "cocos2d.h"

@interface ColoredSquareSprite : CCNode <CCRGBAProtocol, CCBlendProtocol> {
	CGSize		size_;
	GLubyte		opacity_;
	ccColor3B	color_;
	
	CGPoint		*squareVertices_;
	
	ccBlendFunc	blendFunc_;
}

@property (nonatomic,readwrite) CGSize size;

/** creates a Square with color and size */
+ (id) squareWithColor: (ccColor4B)color size:(CGSize)sz;

/** initializes a Circle with color and radius */
- (id) initWithColor:(ccColor4B)color size:(CGSize)sz;

- (BOOL) containsPoint:(CGPoint)point;

@end
