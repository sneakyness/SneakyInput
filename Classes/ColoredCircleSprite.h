#import "cocos2d.h"

@interface ColoredCircleSprite : CCDrawNode {
	float		radius_;
	float		opacity_;
	CCColor	*color_;
	
	NSUInteger numberOfSegments;
    CGPoint *circleVertices_;
	
	ccBlendFunc	blendFunc_;
}

@property (nonatomic,readwrite) float radius;

/** creates a Circle with color and radius */
+ (id) circleWithColor: (CCColor *)color radius:(GLfloat)r;

/** initializes a Circle with color and radius */
- (id) initWithColor:(CCColor *)color radius:(GLfloat)r;

- (BOOL) containsPoint:(CGPoint)point;

@end
