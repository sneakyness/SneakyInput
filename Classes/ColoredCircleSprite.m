
#import "ColoredCircleSprite.h"

@interface ColoredCircleSprite (privateMethods)
- (void) updateContentSize;
@end


@implementation ColoredCircleSprite

@synthesize radius=radius_;
@dynamic cascadeColorEnabled;
@dynamic cascadeOpacityEnabled;

+ (id) circleWithColor: (ccColor4B)color radius:(GLfloat)r
{
	return [[self alloc] initWithColor:color radius:r];
}

- (id) initWithColor:(ccColor4B)color radius:(GLfloat)r
{
	if( (self=[self init]) ) {
		self.radius	= r;
		
		color_.r = color.r;
		color_.g = color.g;
		color_.b = color.b;
		opacity_ = color.a;
	}
	return self;
}

- (void) dealloc
{
	free(circleVertices_);
}

- (id) init
{
	if((self = [super init])){
		radius_				= 10.0f;
		numberOfSegments	= 36U;
		
        //self.shaderProgram = [[CCShaderCache sharedShaderCache] programForKey:kCCShader_PositionColor];
        
			// default blend function
		blendFunc_ = (ccBlendFunc) { CC_BLEND_SRC, CC_BLEND_DST };
		
		color_.r =
		color_.g =
		color_.b = 0U;
		opacity_ = 255U;
		
		circleVertices_ = (CGPoint*) malloc(sizeof(CGPoint)*(numberOfSegments));
		if(!circleVertices_){
			NSLog(@"Ack!! malloc in colored circle failed");
			return nil;
		}
		memset(circleVertices_, 0, sizeof(CGPoint)*(numberOfSegments));
		
		self.radius			= radius_;
	}
	return self;
}

-(void) setRadius: (float) size
{
	radius_ = size;
	const float theta_inc	= 2.0f * 3.14159265359f/numberOfSegments;
	float theta				= 0.0f;
	
	for(int i=0; i<numberOfSegments; i++)
	{
#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
		float j = radius_ * cosf(theta) + self.position.x;
		float k = radius_ * sinf(theta) + self.position.y;
#elif defined(__MAC_OS_X_VERSION_MAX_ALLOWED)
		float j = radius_ * cosf(theta) + position_.x;
		float k = radius_ * sinf(theta) + position_.y;
#endif				
		
		circleVertices_[i] = ccp(j,k);
		
		theta += theta_inc;
	}
	
	[self updateContentSize];
}

-(void) setContentSize: (CGSize) size
{
	self.radius	= size.width/2;
	[self updateContentSize];
}

- (void) updateContentSize
{
	[super setContentSize:CGSizeMake(radius_*2, radius_*2)];
}

- (void)draw
{		
	ccDrawSolidPoly(circleVertices_, numberOfSegments, ccc4f(color_.r/255.0f, color_.g/255.0f, color_.b/255.0f, opacity_/255.0f));
}

#pragma mark CCRGBAProtocol

-(ccColor3B) color
{
	return color_;
}

-(void) setColor:(ccColor3B)color
{
	color_ = color;
}

-(ccColor3B) displayedColor
{
	return color_;
}

-(BOOL) isCascadeColorEnabled
{
	return YES;
}

-(void) updateDisplayedColor:(ccColor3B)color
{
	[self setColor:color];
}

-(GLubyte) opacity
{
	return opacity_;
}

-(void) setOpacity:(GLubyte)opacity
{
	opacity_ = opacity;
}

-(GLubyte) displayedOpacity
{
	return opacity_;
}

-(BOOL) isCascadeOpacityEnabled
{
	return YES;
}

-(void) updateDisplayedOpacity:(GLubyte)opacity
{
	[self setOpacity:opacity];
}

#pragma mark CCBlendProtocol

-(ccBlendFunc) blendFunc
{
	return blendFunc_;
}

-(void) setBlendFunc:(ccBlendFunc)blendFunc
{
	blendFunc_ = blendFunc;
}

#pragma mark Touch

- (BOOL) containsPoint:(CGPoint)point
{
	float dSq = point.x * point.x + point.y * point.y;
	float rSq = radius_ * radius_;
	return (dSq <= rSq );
}

- (NSString*) description
{
	return [NSString stringWithFormat:@"<%@ = %8@ | Tag = %i | Color = %02X%02X%02X%02X | Radius = %1.2f>", [self class], self, self.tag, color_.r, color_.g, color_.b, opacity_, radius_];
}

@end
