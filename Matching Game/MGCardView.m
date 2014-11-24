//
//  MGCardView.m
//  Matching Game
//
//  Created by Nicholas Kraftor on 11/22/14.
//  Copyright (c) 2014 Enterprise Holdings Inc. All rights reserved.
//

#import "MGCardView.h"


@interface MGCardView()
@property (nonatomic) CGFloat faceCardScaleFactor;
@end

@implementation MGCardView

@synthesize faceCardScaleFactor = _faceCardScaleFactor;

#define DEFAULT_FACE_CARD_SCALE_FACTOR 1.0

- (CGFloat) faceCardScaleFactor
{
    if (!_faceCardScaleFactor) {
        _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    }
    
    return _faceCardScaleFactor;
}

- (void) setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor
{
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}

- (void)pinch:(UIPinchGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        self.faceCardScaleFactor *= gesture.scale;
        gesture.scale = 1;
    }
}

- (void)drawRect:(CGRect)rect
{
    if (self.faceUp) {
        
        UIImage *faceImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg", self.picture]];
        
        if (faceImage) {
            CGRect imageRect = CGRectInset(self.bounds,
                                           self.bounds.size.width * (1.0 - self.faceCardScaleFactor),
                                           self.bounds.size.height * (1.0 - self.faceCardScaleFactor));
            
            [faceImage drawInRect:imageRect];
        }
    } else {
        [[UIImage imageNamed:@"card.jpg"] drawInRect:self.bounds];
    }
}

- (void)pushContextAndRotateUpsideDown
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}

- (void) popContext
{
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

#pragma Initialization

- (void)setup
{
    //Initialization here
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
