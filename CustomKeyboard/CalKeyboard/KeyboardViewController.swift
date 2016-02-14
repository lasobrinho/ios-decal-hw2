//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit
import AVFoundation

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    var keyboardView: UIView!
    var audioPlayer:AVAudioPlayer!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
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
    
    @IBAction func playKey(sender: UIButton) {
        self.playNote(sender.currentTitle!);
    }
    
    func playNote(note : String) {
        let audioFilePath = NSBundle.mainBundle().pathForResource(note, ofType: "mp3")!
        do {
            let audioFileUrl = NSURL.fileURLWithPath(audioFilePath)
            audioPlayer = try AVAudioPlayer(contentsOfURL: audioFileUrl, fileTypeHint: nil)
        } catch {
            fatalError("Error playing sound from file " + note + ".mp3")
        }
        audioPlayer.play()
        self.textDocumentProxy.insertText(note + " ")
    }
    
    @IBAction func returnButton(sender: AnyObject) {
        self.textDocumentProxy.insertText("\n")
    }
    
    @IBAction func deleteButton(sender: AnyObject) {
        self.textDocumentProxy.deleteBackward()
    }
    
    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1.png")!)
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        
    }
    
}
