#import "cocos2d.h"

@interface ColoredCircleSprite : CCNode <CCRGBAProtocol, CCBlendProtocol> {
	float		radius_;
	GLubyte		opacity_;
	ccColor3B	color_;
	
	NSUInteger numberOfSegments;
    CGPoint *circleVertices_;
	
	ccBlendFunc	blendFunc_;
}

@property (nonatomic,readwrite) float radius;

/** creates a Circle with color and radius */
+ (id) circleWithColor: (ccColor4B)color radius:(GLfloat)r;

/** initializes a Circle with color and radius */
- (id) initWithColor:(ccColor4B)color radius:(GLfloat)r;

- (BOOL) containsPoint:(CGPoint)point;

@end
