//
//  LIYMainViewController.m
//  LIYBoid
//
//  Created by Jason Cheladyn on 9/24/13.
//  Copyright (c) 2013 Jason Cheladyn. All rights reserved.
//

#import "LIYMainViewController.h"
#import "LIYMainScene.h"

@implementation LIYMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    SKView *view = (SKView *)self.view;
    view.showsFPS = YES;
    view.showsNodeCount = YES;
    view.showsDrawCount = YES;
    
    SKScene *scene = [LIYMainScene sceneWithSize:view.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    [view presentScene:scene];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
