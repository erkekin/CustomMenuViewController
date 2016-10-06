//
//  CustomMenuViewController.swift
//  CustomMenuViewController
//
//  Created by Erk Ekin on 06/10/2016.
//  Copyright © 2016 Erk Ekin. All rights reserved.
//

import UIKit

class CustomMenuViewController: UITextView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willShowMenu), name: NSNotification.Name.UIMenuControllerWillShowMenu, object: nil)
        
    }
    
    func willShowMenu(){
        
        print("deneme");
        
        DispatchQueue.main.async {
            
            UIMenuController.shared.setMenuVisible(false, animated: false)
            
        }
    }
}
