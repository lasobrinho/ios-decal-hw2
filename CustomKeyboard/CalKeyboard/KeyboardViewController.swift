//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

import SpriteKit
import AVFoundation

import AudioToolbox



class KeyboardViewController: UIInputViewController {
    
    var audioPlayer:AVAudioPlayer!
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    var asdasd : [asd] = []
    let notes0 = ["C", "D", "E", "F", "G", "A", "B"]
    let notes1 = ["C#", "D#", "F#", "G#", "A#"]
    var offset = 47
    
    var keyboardView: UIView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    func play(sender: asd) {
        self.textDocumentProxy.insertText(sender.note + " ")
        sender.play()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadInterface()
        
        for i in 0..<7 {
            asdasd.append(asd(note: notes0[i], offset: offset * i, type: 0))
            asdasd[i].addTarget(self, action: "play:", forControlEvents: .TouchUpInside)
            keyboardView.addSubview(asdasd[i])
        }
        
        for i in 0..<5 {
            if i > 1 {
                asdasd.append(asd(note: notes1[i], offset: 47 + offset * i, type: 1))
            } else {
                asdasd.append(asd(note: notes1[i], offset: offset * i, type: 1))
            }
            asdasd[7 + i].addTarget(self, action: "play:", forControlEvents: .AllEvents)
            keyboardView.addSubview(asdasd[7 + i])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        
    }
}
