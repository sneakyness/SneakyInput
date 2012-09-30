//
//  CCNavigationViewController.mm
//  Created by Goffredo Marocchi on 09/30/2012.
//  Copyright 2012 Goffredo Marocchi All rights reserved.
//  BSD license.

#import "CCNavigationViewController.h"
#import "cocos2d.h"

@interface CCNavigationViewController ()

@end

@implementation CCNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#ifdef __IPHONE_OS_VERSION_MAX_ALLOWED
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 60000

-(NSUInteger)supportedInterfaceOrientations{
    
    /**
     *How you could programmatically determine whether you would like the method to dynamically decide whether the interface can be autorotated to an orientation or not.
     if(!delegate.levelLoaded) {
        NSLog(@"%s __ level not loaded", __PRETTY_FUNCTION__);
        return UIInterfaceOrientationMaskPortrait;
     }
     
     NSLog(@"%s __ level loaded", __PRETTY_FUNCTION__);
     if(![SysTools iPadUI] ) {
        return UIInterfaceOrientationMaskAll;
     }
     else {
        return UIInterfaceOrientationMaskAll;
     }
     */
    
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return YES;
}
#endif
#endif

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    /**
     *How you could programmatically determine whether you would like the method to dynamically decide whether the interface can be autorotated to an orientation or not.
     
     if(!delegate.levelLoaded) {
        NSLog(@"%s __ level not loaded", __PRETTY_FUNCTION__);
        return UIInterfaceOrientationIsPortrait(interfaceOrientation);
     }
     
     NSLog(@"%s __ level loaded", __PRETTY_FUNCTION__);
     if(![SysTools iPadUI] ) {
        return YES;
     }
     else {
        return YES;
     }
     */
    
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    //NSLog(@"Old orientation code = %d", fromInterfaceOrientation);
    
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    //NSLog(@"%s", __PRETTY_FUNCTION__);
    
    /**
     *A way you could react when the orientation changes.
     if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
     [delegate rotatedToLandscape:YES];
     }
     else if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
     [delegate rotatedToLandscape:NO];
     }
     */
}

@end