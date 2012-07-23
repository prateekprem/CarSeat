//
//  AnimateViews.m
//
//  Created by Tarun on 12/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
// Changed to support ARC 
#import "AnimateViews.h"

static AnimateViews* classObject = nil;

@implementation AnimateViews
@synthesize animatedView, animationType, animationSubType, animationStartingFrame, callbackFunction, isForRemovingView;


+ (AnimateViews*) allocate {
	
	@synchronized(self) {
		
		if(!classObject){
			classObject = [[AnimateViews alloc]init];
			classObject.callbackFunction = NULL;
		}
	}
	return classObject;
}




- (void)startAnimationOnview:(UIView*)fromView toView:(UIView*)toView animationType:(AnimationType)animateType animationSubType:(NSString*)animateSubType {
	
	self.animationType = animateType;
	self.animationSubType = animateSubType;
	self.animatedView = fromView;
	
	switch (self.animationType) {
			
		case BounceViewAnimationType:
			[self startBounceViewAnimation];
			break;
		case BounceViewRevertAnimationType:
			[self startBounceViewRevertAnimation];
			break;
		case RevealViewAnimationType:
			[self startRevealViewAnimation];
			break;
		case PushViewAnimationType:
			[self startPushViewAnimation];
			break;
		case PushViewRevertAnimationType:
			[self startPushViewRevertAnimation];
			break;
		case RippleViewRevertAnimationType:
			[self startRippleViewAnimation];
			break;
		case ShakeViewRevertAnimationType:
			[self startShakeViewAnimation];
			break;
		case ZoomViewAnimationType:
			[self startZoomViewAnimation];
			break;
		case CubeAnimationType:
			[self startCubeAnimation];
            break;
		case FlipAnimationType:
			[self startFlipViewAnimation];
        case FadeAnimationType:
            [self startFadeViewAnimation];
		default:
			break;
	}
}




- (void) bounce1AnimationStopped {
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
	self.animatedView.transform = CGAffineTransformMakeScale(0.98, 0.98);
	[UIView commitAnimations];
}

- (void) bounce2AnimationStopped {
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(onStoppingAnimation)];
	self.animatedView.transform = CGAffineTransformIdentity;
	[UIView commitAnimations];
}


#pragma mark -
#pragma mark StartAnimation
- (void) startBounceViewAnimation
{
	self.animatedView.transform = CGAffineTransformMakeScale(0.001, 0.001);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
	self.animatedView.transform = CGAffineTransformMakeScale(1.1, 1.1);
	[UIView commitAnimations];	
}

- (void) startFlipViewAnimation
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
	if(self.animationSubType == kCATransitionFromLeft)
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.animatedView cache:YES];
	else if(self.animationSubType == kCATransitionFromRight)
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.animatedView cache:YES];
	
	[UIView commitAnimations];	
}

- (void) startZoomViewAnimation
{
	self.animatedView.transform = CGAffineTransformMakeScale(0.001, 0.001);
	CGPoint initialPoint = self.animatedView.layer.position;
	self.animatedView.layer.position = CGPointMake(self.animatedView.layer.position.x, self.animatedView.frame.size.height);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.8];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(onStoppingAnimation)];
	self.animatedView.transform = CGAffineTransformIdentity;
	self.animatedView.layer.position = initialPoint;
	[UIView commitAnimations];	
}

- (void) startCubeAnimation
{
    CATransition* trans = [CATransition animation];
   trans.type = @"pageCurl";
   trans.subtype = kCATransitionFromRight;
    trans.duration = 1.2;
    trans.removedOnCompletion = YES;
   trans.delegate = self;
    [self.animatedView.layer addAnimation:trans forKey:nil];
}


- (void) startBounceViewRevertAnimation
{	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(onStoppingAnimation)];
	self.animatedView.transform = CGAffineTransformMakeScale(0.001, 0.001);
	[UIView commitAnimations];	
	
	if([self.animationSubType caseInsensitiveCompare:@"withRotation"] == NSOrderedSame)
		[[self.animatedView layer] addAnimation:[self createSimpleRotationAnimation] forKey:@"move along x"];
	
	/*CGFloat h = 200;
	CGFloat v = 75;
	CGMutablePathRef path = CGPathCreateMutable();
	int leftright = 1;
	CGPoint next = self.animatedView.layer.position;
	CGPoint pos;
	CGPathMoveToPoint(path, NULL, next.x, next.y);
	for (int i = 0; i < 4; i++) {
		pos = next;
		leftright *= -1;
		next = CGPointMake(pos.x+h*leftright, pos.y+v);
		CGPathAddCurveToPoint(path, NULL, pos.x, pos.y+30, next.x, next.y-30,
							  next.x, next.y);
	}
	CAKeyframeAnimation* anim1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	anim1.path = path;
	anim1.calculationMode = kCAAnimationPaced;*/
	
	
	//////
	/*NSArray* revs = [NSArray arrayWithObjects:
					 [NSNumber numberWithFloat:0],
					 [NSNumber numberWithFloat:M_PI],
					 [NSNumber numberWithFloat:0],
					 [NSNumber numberWithFloat:M_PI],
					 nil];
	CAKeyframeAnimation* anim2 =
    [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
	anim2.values = revs;
	anim2.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
	anim2.calculationMode = kCAAnimationLinear;
	
	//////////
	NSArray* pitches = [NSArray arrayWithObjects:
						[NSNumber numberWithFloat:0],
						[NSNumber numberWithFloat:M_PI/60.0],
						[NSNumber numberWithFloat:0],
						[NSNumber numberWithFloat:-M_PI/60.0],
						[NSNumber numberWithFloat:0],
						nil];
	CAKeyframeAnimation* anim3 =
    [CAKeyframeAnimation animationWithKeyPath:@"transform"];
	anim3.values = pitches;
	anim3.repeatCount = HUGE_VALF;
	anim3.duration = 0.5;
	anim3.additive = YES;
	anim3.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
		
	
	CAAnimationGroup* group = [CAAnimationGroup animation];
	group.animations = [NSArray arrayWithObjects:anim3, nil];
	group.duration = 2;
	//[self.animatedView.layer addAnimation:group forKey:nil];
	//[CATransaction setDisableActions:YES];
	
	CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	rotationAnimation.fromValue = [NSNumber numberWithFloat: M_PI];
	rotationAnimation.toValue = [NSNumber numberWithFloat: 0.0];
	rotationAnimation.duration = 4.5;
	[animatedView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation1"];
	
	CABasicAnimation *rotationAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	rotationAnimation2.toValue = [NSNumber numberWithFloat: M_PI];
	rotationAnimation.autoreverses = YES;
	rotationAnimation2.duration = 0.6;
	rotationAnimation2.cumulative = YES;
	//[animatedView.layer addAnimation:rotationAnimation2 forKey:@"rotationAnimation2"];
	//self.animatedView.layer.position = next;*/
}

- (void) startRevealViewAnimation
{
	CATransition* animation = [CATransition animation];
	animation.duration = 0.6;
	animation.type = kCATransitionReveal;
	animation.subtype = self.animationSubType;
	animation.removedOnCompletion = YES;
	[self.animatedView.layer addAnimation:animation forKey:nil];
}
- (void) startFadeViewAnimation
{
	CATransition* animation = [CATransition animation];
	animation.duration = 1.6;
	animation.type = kCATransitionFade;
	animation.subtype = self.animationSubType;
	animation.removedOnCompletion = YES;
	[self.animatedView.layer addAnimation:animation forKey:nil];
}

- (void) startPushViewAnimation
{
	CATransition* animation = [CATransition animation];
	animation.duration = 0.4;
	animation.delegate = self;
	animation.type = kCATransitionPush;
	animation.subtype = self.animationSubType;
	animation.removedOnCompletion = YES;
	[self.animatedView.layer addAnimation:animation forKey:nil];
	
	//CGSize theSize = self.animatedView.frame.size;
//	CGPoint origin = self.animatedView.frame.origin;
//	
//	self.animatedView.frame = CGRectMake(origin.x , origin.y, theSize.width, theSize.height);
//
//	[UIView beginAnimations:@"animationID" context:NULL];
//	[UIView setAnimationDuration:1.5];
//
//	self.animatedView.frame = CGRectMake(0, 1025, theSize.width, theSize.height);
//	[UIView commitAnimations];
}

- (void) startPushViewRevertAnimation
{
	//CATransition* animation = [CATransition animation];
//	animation.duration = 0.6;
//	animation.type = kCATransitionReveal;
//	animation.subtype = self.animationSubType;
//	animation.removedOnCompletion = YES;
//	[self.animatedView.layer addAnimation:animation forKey:nil];
}

- (void) startRippleViewAnimation {
	
	CATransition* animation = [CATransition animation];
	animation.duration = 2.0;
	animation.timingFunction = 0;
	animation.removedOnCompletion = YES;
	animation.type = @"rippleEffect";
	animation.subtype = kCATransitionFromBottom;
	[self.animatedView.layer addAnimation:animation forKey:@"animation"];
}

- (void) startShakeViewAnimation {
		
	[self.animatedView shakeX];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
	[self onStoppingAnimation];
}

- (void) onStoppingAnimation {
	
	switch (self.animationType) {
			
		case BounceViewAnimationType:
		{
			self.animatedView.transform = CGAffineTransformIdentity;
			if(self.isForRemovingView){
				[self.animatedView removeFromSuperview];
			}
			if(self.callbackFunction != NULL){
				self.callbackFunction();
				self.callbackFunction = NULL;
			}
			
			
		}
			break;
			
		case BounceViewRevertAnimationType:
		{
		//	self.animatedView.transform = CGAffineTransformIdentity;
			if(self.isForRemovingView){
				[self.animatedView removeFromSuperview];
			}
			
			if(self.callbackFunction != NULL){
				self.callbackFunction();
				self.callbackFunction = NULL;
			}
			
		}
			break;
		case PushViewAnimationType:
		{
			self.animatedView.transform = CGAffineTransformIdentity;
			if(self.isForRemovingView){
				[self.animatedView removeFromSuperview];
			}
						
			if(self.callbackFunction != NULL){
				self.callbackFunction();
				self.callbackFunction = NULL;
			}
			
			
		}
			break;
			
		case ShakeViewRevertAnimationType:
		{
			if(self.isForRemovingView){
			}
			
			if(self.callbackFunction != NULL){
				self.callbackFunction();
				self.callbackFunction = NULL;
			}
			
			
		}
			break;
		case ZoomViewAnimationType:
		{
			self.animatedView.transform = CGAffineTransformIdentity;
			if(self.isForRemovingView){
				
			}
			
			if(self.callbackFunction != NULL){
				self.callbackFunction();
				self.callbackFunction = NULL;
			}
			
		}
			break;
		case CubeAnimationType:
		{
			if(self.isForRemovingView){
				
			}
			
			if(self.callbackFunction != NULL){
				self.callbackFunction();
				self.callbackFunction = NULL;
			}
			
		}
			break;
		case FlipAnimationType:
		{
			if(self.isForRemovingView){
				
			}
			
			if(self.callbackFunction != NULL){
				self.callbackFunction();
				self.callbackFunction = NULL;
			}
			
		}
			break;
		default:
			break;
	}
}


- (void) moveViewOnY: (UIView *) moving toPosition: (NSNumber *) position{
    
    CABasicAnimation *move = [self createBasicAnimationWithKeyPath:@"transform.translation.y" 
                                                       andPosition:position];
    [[moving layer] addAnimation:move forKey:@"move along y"];
}

- (void) moveViewOnX: (UIView *) moving toPosition: (NSNumber *) position{  
    CABasicAnimation *move = [self createBasicAnimationWithKeyPath:@"transform.translation.x" 
                                                       andPosition:position];
    [[moving layer] addAnimation:move forKey:@"move along x"];
}

- (CABasicAnimation *) createBasicAnimationWithKeyPath: (NSString *) keyPath andPosition: (NSNumber *) position {
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:keyPath];
    [move setFromValue:[NSNumber numberWithFloat:-2.0f]];
    [move setToValue:position];
    [move setRemovedOnCompletion:NO];
    [move setFillMode:kCAFillModeForwards];
    [move setDuration:0.2];
    [move setAutoreverses:YES];
	
    return move;
}

- (CABasicAnimation *) createSimpleRotationAnimation {
    CABasicAnimation *fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [fullRotation setFromValue:[NSNumber numberWithFloat:0]];
    [fullRotation setToValue:[NSNumber numberWithFloat:((360*M_PI)/180)]];
    [fullRotation setDuration:0.5f];
    return fullRotation;
}

- (CABasicAnimation *) createSimpleScaleAnimation {
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [scale setToValue:[NSNumber numberWithFloat:10.0f]];
    [scale setDuration:1.0f];
    return scale;
}



@end

@implementation UIView (I7ShakeAnimation)

- (void)shakeX {
	[self shakeXWithOffset:40.0 breakFactor:0.85 duration:1.5 maxShakes:30];
}

- (void)shakeXWithOffset:(CGFloat)aOffset breakFactor:(CGFloat)aBreakFactor duration:(CGFloat)aDuration maxShakes:(NSInteger)maxShakes {
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	[animation setDuration:aDuration];
	[animation setDelegate:self];
	
	
	NSMutableArray *keys = [NSMutableArray arrayWithCapacity:20];
	int infinitySec = maxShakes;
	while(aOffset > 0.01) {
		[keys addObject:[NSValue valueWithCGPoint:CGPointMake(self.center.x - aOffset, self.center.y)]];
		aOffset *= aBreakFactor;
		[keys addObject:[NSValue valueWithCGPoint:CGPointMake(self.center.x + aOffset, self.center.y)]];
		aOffset *= aBreakFactor;
		infinitySec--;
		if(infinitySec <= 0) {
			break;
		}
	}
	
	animation.values = keys;	
	[self.layer addAnimation:animation forKey:@"position"];
}

@end
