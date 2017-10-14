//
//  GameScene.swift
//  Emaze
//
//  Created by Tirth Patel on 2017-10-13.
//  Copyright © 2017 Tirth Patel. All rights reserved.

        
import SpriteKit
import CoreMotion
        
class GameScene: SKScene, SKPhysicsContactDelegate{
            
        let manager = CMMotionManager()
        var player = SKSpriteNode()
        var endNode = SKSpriteNode()
            
    override func didMove(to view: SKView) {
                
                
        self.physicsWorld.contactDelegate = self
                
        player = self.childNode(withName: "player") as! SKSpriteNode
        endNode = self.childNode(withName: "theEnd") as! SKSpriteNode
                
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main){
                    (data, error) in
                    
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!) * 10, dy: CGFloat((data?.acceleration.y)!) * 10)
                    
        }
        
        func didBegin(contact: SKPhysicsContact){
            let bodyA = contact.bodyA
            let bodyB = contact.bodyB
            
            if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1{
                
                print("Yuppie You Won")
                
            }
        }
        
        func update(_ currentTime: TimeInterval) {
            /* Called before each frame is rendered */
        }
    }
    
    
    }

            


