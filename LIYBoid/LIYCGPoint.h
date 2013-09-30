//
//  LIYCGPoint.h
//  LIYBoid
//
//  Created by Jason Cheladyn on 9/24/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//
//  This code is a copy of Cocoa2d ccMarco and CGPointExtension

#import <CoreGraphics/CoreGraphics.h>
#import <math.h>
#import <objc/objc.h>


//~~~Macros

#define LIYRANDOM_MINUS_1_1() ((random() / (float)0x3fffffff )-1.0f)
#define LIYRANDOM_0_1() ((random() / (float)0x7fffffff))
#define LIY_DEGREES_TO_RADIANS(angle) ((angle) * 0.01745329252f)
#define LIY_RADIANS_TO_DEGREES(angle) ((angle) * 57.29577951f)

#define CC_SWAP( x, y )         \
({ __typeof__(x) temp  = (x);   \
x = y; y = temp;                \
})

//~~~~


#ifdef _cplusplus
extern "C" {
#endif

#define CGP(x, y) CGPointMake(x, y)

static inline CGPoint
    CGPNeg(const CGPoint v) {
        return CGP(-v.x, -v.y);
}

static inline CGPoint
    CGPAdd(const CGPoint v1, const CGPoint v2) {
        return CGP(v1.x + v2.x, v1.y + v2.y);
    }

static inline CGPoint
    CGPSub(const CGPoint v1, CGPoint v2) {
        return CGP(v1.x - v2.x, v1.y - v2.y);
    }

static inline CGPoint
    CGPMult(const CGPoint v, const CGFloat s) {
        return CGP(v.x*s, v.y*s);
    }

static inline CGPoint
    CGPMidPoint(const CGPoint v1, const CGPoint v2) {
        return CGPMult(CGPAdd(v1, v2), 0.5);
    }

static inline CGFloat
    CGPDot(const CGPoint v1, const CGPoint v2) {
        return v1.x*v2.x + v1.y*v2.y;
    }

static inline CGFloat
    CGPCross(const CGPoint v1, const CGPoint v2) {
        return v1.x*v2.y - v1.y*v2.x;
    }

static inline CGPoint
    CGPRPrep(const CGPoint v) {
        return CGP(v.y, -v.y);
    }
    
static inline CGPoint
    CGPProject(const CGPoint v1, const CGPoint v2) {
        return CGPMult(v2, CGPDot(v1, v2) / CGPDot(v2, v2));
    }

static inline CGPoint
    CGPRotate(const CGPoint v1, const CGPoint v2) {
        return CGP(v1.x*v2.x + v1.y*v2.y, v1.x*v2.y + v1.y*v2.x);
    }

static inline CGPoint
    CGPUnrotate(const CGPoint v1, const CGPoint v2) {
        return CGP(v1.x*v2.x + v1.y*v2.y, v1.y*v2.x - v1.x*v2.y);
    }

static inline CGFloat
    CGPLengthSQ(const CGPoint v) {
        return CGPDot(v, v);
    }

CGFloat CGPLength(const CGPoint v);
CGFloat CGPDistance(const CGPoint v1, const CGPoint v2);
CGPoint CGPNormalize(const CGPoint v);
CGPoint CGPForAngle(const CGFloat a);
CGFloat CGPToAngle(const CGPoint v);
float clampf(float value, float min_inclusive, float max_inclusive);
CGPoint CGPClamp(CGPoint p, CGPoint from, CGPoint to);
CGPoint CGPFromSize(CGSize s);
CGPoint CGPCampOp(CGPoint p, float(*opFunc)(float));
CGPoint CGPLerp(CGPoint a, CGPoint b, float variance);
BOOL CPGFuzzyEqual(CGPoint a, CGPoint b, float variance);
CGPoint CGPCompMult(CGPoint a, CGPoint b);
float CGPAngleSinged(CGPoint a, CGPoint b);
float CGPAngle(CGPoint a, CGPoint b);
CGPoint CGPRotateByAngle(CGPoint v, CGPoint pivot, float angle);
BOOL CGPLineIntersect(CGPoint p1, CGPoint p2, CGPoint p3, CGPoint p4, float *s, float *t);

#ifdef  __cplusplus
}
#endif