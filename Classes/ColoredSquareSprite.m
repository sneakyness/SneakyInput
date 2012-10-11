
#import "ColoredSquareSprite.h"

@interface ColoredSquareSprite (privateMethods)
- (void) updateContentSize;
- (void) updateColor;
@end


@implementation ColoredSquareSprite

@synthesize size=size_;
	// Opacity and RGB color protocol
@synthesize opacity=opacity_, color=color_;
@synthesize blendFunc=blendFunc_;

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
	
    squareVertices_[0] = ccp(position_.x - size_.width,position_.y - size_.height);
    squareVertices_[1] = ccp(position_.x + size_.width,position_.y - size_.height);
    squareVertices_[2] = ccp(position_.x - size_.width,position_.y + size_.height);
    squareVertices_[3] = ccp(position_.x + size_.width,position_.y + size_.height);
	
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

#pragma mark Protocols
	// Color Protocol

-(void) setColor:(ccColor3B)color
{
	color_ = color;
}

-(void) setOpacity: (GLubyte) o
{
	opacity_ = o;
	[self updateColor];
}

#pragma mark Touch

- (BOOL) containsPoint:(CGPoint)point
{
	return (CGRectContainsPoint([self boundingBox], point));
}

- (NSString*) description
{
#ifdef __CC_PLATFORM_IOS
	return [NSString stringWithFormat:@"<%@ = %8@ | Tag = %i | Color = %02X%02X%02X%02X | Size = %f,%f>", [self class], self, tag_, color_.r, color_.g, color_.b, opacity_, size_.width, size_.height];
#else
    return [NSString stringWithFormat:@"<%@ = %8@ | Tag = %li | Color = %02X%02X%02X%02X | Size = %f,%f>", [self class], self, tag_, color_.r, color_.g, color_.b, opacity_, size_.width, size_.height];
#endif
}

@end