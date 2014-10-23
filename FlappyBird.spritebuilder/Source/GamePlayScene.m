#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"]; // Will load a new Character from the CCB file we created for you named Character. CCB files are created by SpriteBuilder and describe the properties and appearance of in-game objects like our Flappy Bird.
    
    [physicsNode addChild:character]; // will add your character as a child of physicsNode so that physics will be applied to it.
    
    [self addObstacle];
}

-(void)update:(CCTime)delta
{
    // put update code here
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
