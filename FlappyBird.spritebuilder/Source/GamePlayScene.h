//
//  GamePlayScene.h
//  FlappyBird
//
//  Created by Gerald on 2/11/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"
#import "Character.h"

typedef NS_ENUM(NSInteger, DrawingOrder) {
    DrawingOrderPipes,
    DrawingOrderGround,
    DrawingOrderHero
};

@interface GamePlayScene : CCNode <CCPhysicsCollisionDelegate>
{
    // define variables here;
    Character*     character; // This variable will store an instance of our Flappy Bird.
    CCPhysicsNode* physicsNode; // reference a node that simulates physics.
}

-(void) initialize;
-(void) addObstacle;
-(void) showScore;

@end
