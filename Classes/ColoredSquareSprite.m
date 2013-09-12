
#import "ColoredSquareSprite.h"

@interface ColoredSquareSprite (privateMethods)
- (void) updateContentSize;
@end


@implementation ColoredSquareSprite

@synthesize size=size_;
@dynamic cascadeColorEnabled;
@dynamic cascadeOpacityEnabled;

+ (id) squareWithColor: (ccColor4B)color size:(CGSize)sz
{
	return [[self alloc] initWithColor:color size:sz];
}

- (id) initWithColor:(ccColor4B)color size:(CGSize)sz
{
	if( (self=[self init]) ) {
		self.size = sz;
		
		color_.r = color.r;
		color_.g = color.g;
		color_.b = color.b;
		opacity_ = color.a;
	}
	return self;
}

- (void) dealloc
{
	free(squareVertices_);
}

- (id) init
{
	if((self = [super init])){
		size_				= CGSizeMake(10.0f, 10.0f);
		
			// default blend function
		blendFunc_ = (ccBlendFunc) { CC_BLEND_SRC, CC_BLEND_DST };
		
		color_.r =
		color_.g =
		color_.b = 0U;
		opacity_ = 255U;
		
		squareVertices_ = (CGPoint*) malloc(sizeof(CGPoint)*(4));
		if(!squareVertices_){
			NSLog(@"Ack!! malloc in colored square failed");
			return nil;
		}
		memset(squareVertices_, 0, sizeof(CGPoint)*(4));
		
		self.size = size_;
	}
	return self;
}

- (void) setSize: (CGSize)sz
{
	size_ = sz;
	
	squareVertices_[0] = ccp(self.position.x - size_.width,self.position.y - size_.height);
	squareVertices_[1] = ccp(self.position.x + size_.width,self.position.y - size_.height);
	squareVertices_[2] = ccp(self.position.x - size_.width,self.position.y + size_.height);
	squareVertices_[3] = ccp(self.position.x + size_.width,self.position.y + size_.height);
	
	[self updateContentSize];
}

-(void) setContentSize: (CGSize)sz
{
	self.size = sz;
}

- (void) updateContentSize
{
	[super setContentSize:size_];
}

- (void)draw
{		
	ccDrawSolidPoly(squareVertices_, 4, ccc4f(color_.r/255.0f, color_.g/255.0f, color_.b/255.0f, opacity_/255.0f));
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
	return (CGRectContainsPoint([self boundingBox], point));
}

- (NSString*) description
{
	return [NSString stringWithFormat:@"<%@ = %8@ | Tag = %i | Color = %02X%02X%02X%02X | Size = %f,%f>", [self class], self, self.tag, color_.r, color_.g, color_.b, opacity_, size_.width, size_.height];
}

@end
