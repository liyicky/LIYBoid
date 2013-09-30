//
//  LIYBoid.h
//  LIYBoid
//
//  Created by Jason Cheladyn on 9/24/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "LIYCGPoint.h"

static const uint32_t chromosomeCategory = 0x1 << 1;
static const uint32_t radiusCategory     = 0x1 << 2;

@interface LIYBoid : SKSpriteNode
{
    CGPoint _position;
    
    @public
    SKNode *_radius;
    LIYBoid *_follower;
}

- (void)think;
@end
