//
//  UIImage+Extension.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit

extension UIImage {
    
    func imageWith(newSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size:newSize)
        let image = renderer.image { _ in
            draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
        }

        return image
    }
    
}



