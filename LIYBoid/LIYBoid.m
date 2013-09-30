//
//  LIYBoid.m
//  LIYBoid
//
//  Created by Jason Cheladyn on 9/24/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import "LIYBoid.h"

#define leftEdge 0.0f
#define bottomEdge 0.0f
#define topEdge 568.0f
#define rightEdge 320.0f

@interface LIYBoid ()

@end

@implementation LIYBoid

- (id)init
{
    self = [super init];
    if (self) {
        
        _follower = nil;
        self = [LIYBoid spriteNodeWithImageNamed:@"triangle"];
        [self boid];
    }
    
    return self;
}

- (void)setRadius
{
    _radius = [[SKNode alloc] init];
    _radius.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:30];
    _radius.name = @"radius";
}

- (void)boid
{
    [self setBody];
    [self setRadius];
    
    [self addChild:_radius];
    
}

- (void)setBody
{
    self.size = CGSizeMake(20, 20);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, -self.size.width/2, -self.size.height/2);
    CGPathAddLineToPoint(path, nil, self.size.width/2, -self.size.height/2);
    CGPathAddLineToPoint(path, nil, 0, self.size.height/2);
    CGPathAddLineToPoint(path, nil, -self.size.width/2, -self.size.height/2);
    self.physicsBody = [SKPhysicsBody bodyWithPolygonFromPath:path];
}

- (void)think
{
    _position = self.position;
    self.physicsBody.velocity.dy - 1;
    float i = self.physicsBody.velocity.dy - 1;
    NSLog(@"%f", i);
    [self handleBorder];
}

- (void)handleBorder
{
    if (_position.x < leftEdge) self.position = CGP(rightEdge, _position.y);
    else if (_position.y < bottomEdge) self.position = CGP(_position.x, topEdge);
    else if (_position.x > rightEdge) self.position = CGP(leftEdge, _position.y);
    else if (_position.y > topEdge) self.position = CGP(_position.x, bottomEdge);
}

@end