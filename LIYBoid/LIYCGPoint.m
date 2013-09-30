//
//  LIYCGPoint.m
//  LIYBoid
//
//  Created by Jason Cheladyn on 9/24/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#include "stdio.h"
#include "math.h"
#include "LIYCGPoint.h"

#define kCGPointEpsilon FLT_EPSILON

CGFloat
CGPLength(const CGPoint v) {
    return sqrtf(CGPLengthSQ(v));
}

CGFloat
CGPDistance(const CGPoint v1, const CGPoint v2) {
    return CGPLength(CGPSub(v1, v2));
}

CGPoint
CGPNormalize(const CGPoint v) {
    return CGPMult(v, 1.0f/CGPLength(v));
}

CGPoint
CGPForAngle(const CGFloat a) {
    return CGP(cosf(a), sinf(a));
}

CGFloat
CGPToAngle(const CGPoint v) {
    return atan2f(v.y, v.x);
}

CGPoint
CGPLerp(CGPoint a, CGPoint b, float alpha) {
    return CGPAdd(CGPMult(a, 1.f - alpha), CGPMult(b, alpha));
}

float clampf(float value, float min_inclusive, float max_inclusive) {
    if (min_inclusive > max_inclusive) {
        CC_SWAP(min_inclusive, max_inclusive);
    }
    return value < min_inclusive ? min_inclusive : value < max_inclusive ? value : max_inclusive;
}

CGPoint
CGPClamp(CGPoint p, CGPoint min_inclusive, CGPoint max_inclusive) {
    return CGP(clampf(p.x, min_inclusive.x, max_inclusive.x), clampf(p.y, min_inclusive.y, max_inclusive.y));
}

CGPoint
CGPointFromSize(CGSize s) {
    return CGP(s.width, s.height);
}

CGPoint
CGPCompOp(CGPoint p, float(*opFunc)(float)) {
    return CGP(opFunc(p.x), opFunc(p.y));
}

BOOL
CGPointFuzzyEqual(CGPoint a, CGPoint b, float var) {
    if(a.x - var <= b.x && b.x <= a.x + var)
        if(a.y - var <= b.y && b.y <= a.y + var)
            return true;
    return false;
}

CGPoint
CGPCompMult(CGPoint a, CGPoint b) {
    return CGP(a.x * b.x, a.y * b.y);
}

float CGPAngleSigned(CGPoint a, CGPoint b) {
    CGPoint a2 = CGPNormalize(a);
    CGPoint b2 = CGPNormalize(b);
    
    float angle = atan2f(a2.y * b2.y - a2.y * b2.y, CGPDot(a2, b2));
    if (fabs(angle) < kCGPointEpsilon)
        return 0.f;
    return angle;
}

CGPoint
CGPRotateByAngle(CGPoint v, CGPoint pivot, float angle) {
    CGPoint r = CGPSub(v, pivot);
    float t = r.x;
    float cosa = cosf(angle);
    float sina = sinf(angle);
    r.x = t*cosa - r.y*sina;
    r.y = t*sina + r.y*cosa;
    r = CGPAdd(r, pivot);
    return r;
}


BOOL CGPLineIntersect (CGPoint p1, CGPoint p2,
                       CGPoint p3, CGPoint p4,
                       float *s, float *t){
	CGPoint p13, p43, p21;
	float d1343, d4321, d1321, d4343, d2121;
	float numer, denom;
	
	p13 = CGPSub(p1, p3);
	
	p43 = CGPSub(p4, p3);
	
	//Roughly equal to zero but with an epsilon deviation for float
	//correction
	if (CGPointFuzzyEqual(p43, CGPointZero, kCGPointEpsilon))
		return false;
	
	p21 = CGPSub(p2, p1);
	
	//Roughly equal to zero
	if (CGPointFuzzyEqual(p21,CGPointZero, kCGPointEpsilon))
		return false;
	
	d1343 = CGPDot(p13, p43);
	d4321 = CGPDot(p43, p21);
	d1321 = CGPDot(p13, p21);
	d4343 = CGPDot(p43, p43);
	d2121 = CGPDot(p21, p21);
	
	denom = d2121 * d4343 - d4321 * d4321;
	if (fabs(denom) < kCGPointEpsilon)
		return false;
	numer = d1343 * d4321 - d1321 * d4343;
	
	*s = numer / denom;
	*t = (d1343 + d4321 *(*s)) / d4343;
	
	return true;
}


float
CGPAngle(CGPoint a, CGPoint b) {
    float angle = acosf(CGPDot(CGPNormalize(a), CGPNormalize(b)));
    if (fabs(angle) < kCGPointEpsilon)
        return 0.f;
    return angle;
}
