//
//  asd.swift
//  CustomKeyboard
//
//  Created by Lucas Alves Sobrinho on 2/12/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class bn: UIButton {
    
    let gradientLayer = CAGradientLayer()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
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
        
        
    }
    
    
    
}
