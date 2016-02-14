//
//  asd.swift
//  CustomKeyboard
//
//  Created by Lucas Alves Sobrinho on 2/12/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class bs: UIButton {
    
    let gradientLayer = CAGradientLayer()
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
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
        self.bringSubviewToFront(self)
    }
}
