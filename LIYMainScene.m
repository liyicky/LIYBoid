//
//  LIYMainScene.m
//  LIYBoid
//
//  Created by Jason Cheladyn on 9/24/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import "LIYMainScene.h"

@implementation LIYMainScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        [self setUp];
    }
    
    return self;
}

- (void)setUp
{
    self.physicsWorld.gravity = CGVectorMake(0, -0.1);
    self.physicsWorld.contactDelegate = self;
    
    _leader = [[LIYBoid alloc] init];
    _leader.position = CGP(200, 100);
    [self addChild:_leader];
    
    LIYBoid *boid = _leader->_follower = [[LIYBoid alloc] init];
    boid.position = CGP(230, 140);
    [self addChild:boid];
}

- (void)update:(NSTimeInterval)currentTime
{
    [self flockGangWeTheBest];
}

- (void)flockGangWeTheBest
{
    LIYBoid *boid = _leader;
    while (boid) {
        LIYBoid *b = boid;
        boid = b->_follower;
        [b think];
    }
}

@end
