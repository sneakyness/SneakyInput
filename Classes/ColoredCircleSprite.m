
#import "ColoredCircleSprite.h"

@interface ColoredCircleSprite (privateMethods)
- (void) updateContentSize;
@end


@implementation ColoredCircleSprite

@synthesize radius=radius_;
@dynamic cascadeColorEnabled;
@dynamic cascadeOpacityEnabled;

+ (id) circleWithColor: (CCColor *)color radius:(GLfloat)r
{
	return [[self alloc] initWithColor:color radius:r];
}

- (id) initWithColor:(CCColor *)color radius:(GLfloat)r
{
	if( (self=[self init]) ) {
		self.radius	= r;
		
        color_ = color;
		opacity_ = color_.alpha;
        [self draw];
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
		blendFunc_ = (ccBlendFunc) { GL_ONE, GL_ONE_MINUS_SRC_ALPHA };
		
        color_ = [CCColor colorWithWhite:0.0f alpha:1.0f];
		opacity_ = color_.alpha;
		
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
    [self draw];
}

-(void) setContentSize: (CGSize) size
{
	self.radius	= size.width/2;
	[self updateContentSize];
    [self draw];
}

- (void) updateContentSize
{
	[super setContentSize:CGSizeMake(radius_*2, radius_*2)];
}

- (void)draw
{
    [self clear];
    [self drawPolyWithVerts:circleVertices_ count:numberOfSegments fillColor:color_ borderWidth:0 borderColor:color_];
}

#pragma mark CCRGBAProtocol

-(CCColor *) color
{
	return color_;
}

-(void) setColor:(CCColor *)color
{
	color_ = color;
    [self draw];
}

-(CCColor *) displayedColor
{
	return color_;
}

-(BOOL) isCascadeColorEnabled
{
	return YES;
}

-(void) updateDisplayedColor:(ccColor4F)color
{
	[self setColor:[CCColor colorWithCcColor4f:color]];
    [self draw];
}

-(CGFloat) opacity
{
	return opacity_;
}

-(void) setOpacity:(CGFloat)opacity
{
	opacity_ = opacity;
    [self draw];
}

-(CGFloat) displayedOpacity
{
	return opacity_;
}

-(BOOL) isCascadeOpacityEnabled
{
	return YES;
}

-(void) updateDisplayedOpacity:(CGFloat)opacity
{
	[self setOpacity:opacity];
    [self draw];
}

#pragma mark CCBlendProtocol

-(ccBlendFunc) blendFunc
{
	return blendFunc_;
}

-(void) setBlendFunc:(ccBlendFunc)blendFunc
{
	blendFunc_ = blendFunc;
    [self draw];
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
	return [NSString stringWithFormat:@"<%@ = %8@ | Tag = %@ | Color = %02f%02f%02f%02f | Radius = %1.2f>", [self class], self, self.name, color_.red, color_.green, color_.blue, opacity_, radius_];
}

@end
