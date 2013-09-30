//
//  LIYMainScene.h
//  LIYBoid
//
//  Created by Jason Cheladyn on 9/24/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "LIYBoid.h"

@interface LIYMainScene : SKScene <SKPhysicsContactDelegate>
{
    LIYBoid *_leader;
}

@end
