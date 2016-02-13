//
//  osydufbils.swift
//  CustomKeyboard
//
//  Created by Lucas Alves Sobrinho on 2/11/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import Foundation

import AVFoundation

class SoundText {
    
    let note : String
    var soundURL : NSURL
    
    init(note: String, soundURL: NSURL) {
        self.note = note
        self.soundURL = NSBundle.mainBundle().URLForResource("C", withExtension: "wav")!
        var mySound: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL, &mySound)
    }
    
}