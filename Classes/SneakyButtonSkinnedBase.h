//
//  SneakyButtonSkinnedBase.h
//  SneakyInput
//
//  Created by Nick Pannuto on 2/19/10.
//  Copyright 2010 Sneakyness, llc.. All rights reserved.
//

#import "cocos2d.h"

@class SneakyButton;

@interface SneakyButtonSkinnedBase : CCSprite {
	CCSprite *defaultSprite;
	CCSprite *activatedSprite;
	CCSprite *disabledSprite;
	CCSprite *pressSprite;
	SneakyButton *button;
}

@property (nonatomic, strong) CCSprite *defaultSprite;
@property (nonatomic, strong) CCSprite *activatedSprite;
@property (nonatomic, strong) CCSprite *disabledSprite;
@property (nonatomic, strong) CCSprite *pressSprite;

@property (nonatomic, strong) SneakyButton *button;

@end
