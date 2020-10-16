//
//  UIView+Extension.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit

extension UIView {
    
    func createSnapshot() -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, 0.0)
        drawHierarchy(in: frame, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}

