//
//  asd.swift
//  CustomKeyboard
//
//  Created by Lucas Alves Sobrinho on 2/11/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit
import AVFoundation

class asd: UIButton {
    
    var note : String
    var audioPlayer : AVAudioPlayer!
    let audioFilePath : String
    let gradientLayer = CAGradientLayer()
    
    init(note : String, offset: Int, type: Int) {
        
        self.note = note
        audioFilePath = NSBundle.mainBundle().pathForResource(note, ofType: "mp3")!
        if type == 0 {
            super.init(frame : CGRect(x: (23 + offset), y: -5, width: 45, height: 150))
            self.setTitleColor(UIColor.blackColor(), forState: .Normal)
            
            gradientLayer.frame = self.bounds
            let color1 = UIColor(red: 0.7, green: 0.7, blue: 0.70, alpha: 1.0).CGColor as CGColorRef
            let color2 = UIColor(red: 1.0, green: 1.0, blue: 1.00, alpha: 1.0).CGColor as CGColorRef
            let color3 = UIColor(red: 1.0, green: 1.0, blue: 0.98, alpha: 1.0).CGColor as CGColorRef
            gradientLayer.colors = [color2, color3, color1]
            gradientLayer.locations = [0.1, 0.95]
            gradientLayer.cornerRadius = 5
            self.layer.addSublayer(gradientLayer)
            
            self.layer.shadowColor = UIColor.blackColor().CGColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 2
            self.layer.shadowOffset = CGSizeMake(0, 5.0)
            
            self.titleEdgeInsets = UIEdgeInsetsMake(100.0, 0.0, 0.0, 0.0)
        } else {
            super.init(frame : CGRect(x: (52 + offset), y: -5, width: 35, height: 90))
            self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
            gradientLayer.frame = self.bounds
            let color4 = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).CGColor as CGColorRef
            let color5 = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0).CGColor as CGColorRef
            let color6 = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).CGColor as CGColorRef
            gradientLayer.colors = [color4, color5, color6]
            gradientLayer.locations = [0.92, 0.945, 0.97]
            gradientLayer.cornerRadius = 5
            self.layer.addSublayer(gradientLayer)
            
            self.layer.shadowColor = UIColor.blackColor().CGColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 1
            self.layer.shadowOffset = CGSizeMake(0, 2.5)
            
            self.titleEdgeInsets = UIEdgeInsetsMake(30, 0.0, 0.0, 0.0)
        }
        
        self.setTitle(note, forState: .Normal)
        
        do {
            let audioFileUrl = NSURL.fileURLWithPath(audioFilePath)
            audioPlayer = try AVAudioPlayer(contentsOfURL: audioFileUrl, fileTypeHint: nil)
        } catch {
            print("error init asd")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func play() {
        audioPlayer.play()
    }
    
}
