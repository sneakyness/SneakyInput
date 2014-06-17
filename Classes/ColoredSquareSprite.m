
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
		
        color_ = [CCColor colorWithCcColor4b:color];
		opacity_ = color.a;
        [self draw];
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
		blendFunc_ = (ccBlendFunc) { GL_ONE, GL_ONE_MINUS_SRC_ALPHA };
		
        color_ = [CCColor colorWithWhite:0.0f alpha:1.0f];
		opacity_ = 1.0f;
		
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
    [self draw];
}

-(void) setContentSize: (CGSize)sz
{
	self.size = sz;
    [self draw];
}

- (void) updateContentSize
{
	[super setContentSize:size_];
}

- (void)draw
{
    [self clear];
    CCColor *fillColor = [CCColor colorWithCcColor4f:ccc4f(color_.red/255.0f, color_.green/255.0f, color_.blue/255.0f, opacity_/255.0f)];
    [self drawPolyWithVerts:squareVertices_ count:4 fillColor:fillColor borderWidth:0 borderColor:fillColor];
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
	return (CGRectContainsPoint([self boundingBox], point));
}

- (NSString*) description
{
	return [NSString stringWithFormat:@"<%@ = %8@ | Tag = %@ | Color = %02f%02f%02f%02f | Size = %f,%f>", [self class], self, self.name, color_.red, color_.green, color_.blue, opacity_, size_.width, size_.height];
}

@end
