#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"]; // Will load a new Character from the CCB file we created for you named Character. CCB files are created by SpriteBuilder and describe the properties and appearance of in-game objects like our Flappy Bird.
    
    [physicsNode addChild:character]; // will add your character as a child of physicsNode so that physics will be applied to it.
    
    [self addObstacle]; //adding obstacle to appear on screen
    timeSinceObstacle = 0.0f; //setting time for obstacle
    
    /*
     We want to add new obstacles at regular intervals. Games typically use what is called an "update loop" or a "run loop" to perform regularly scheduled activities. Sometimes code is run really fast - in Cocos2D the update loop runs 60 times per second by default! That code usually checks things like player health, whether enemies have died, or whether our character is jumping too high!
     */
}

-(void)update:(CCTime)delta
{
    // Increment the time since the last obstacle was added
    timeSinceObstacle += delta; // delta is approximately 1/60th of a second
    
    // Check to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        // Add a new obstacle
        [self addObstacle];
        
        // Then reset the timer.
        timeSinceObstacle = 0.0f;
    }
}

/*
 This method is part of the Cocos2D game engine and whenever the player touches the screen, this method is called automatically -- all you need to do is fill it in.
 */
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    // this will get called every time the player touches the screen
    
    [character flap];
    //Now, whenever a new touch begins, we will call the 'flap' method on our character which will apply an impulse to our character. This will be simulated by the physicsNode and the character will fly upwards.
}

@end
