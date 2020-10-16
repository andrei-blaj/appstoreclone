//
//  UIWindow+Extension.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit

extension UIWindow {
  
    private class var key: UIWindow {
        
        if #available(iOS 13.0, *) {
            guard let keyWindow = UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive || $0.activationState == .foregroundInactive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first else {
                fatalError("Fatal Error: now window is set to keyWindow")
            }
            
            return keyWindow
        } else {
            guard let keyWindow = UIApplication.shared.keyWindow else {
                fatalError("Fatal Error: now window is set to keyWindow")
            }
            return keyWindow
        }
        
    }
  
    private class var keySafeAreaInsets: UIEdgeInsets {
        guard #available(iOS 11.0, *) else { return .zero }
        return UIWindow.key.safeAreaInsets
    }
    
    class var topPadding: CGFloat {
        return UIWindow.keySafeAreaInsets.top
    }
    
    class var bottomPadding: CGFloat {
        return UIWindow.keySafeAreaInsets.bottom
    }
    
}

