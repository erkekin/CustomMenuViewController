//
//  CustomMenuViewController.swift
//  CustomMenuViewController
//
//  Created by Erk Ekin on 06/10/2016.
//  Copyright © 2016 Erk Ekin. All rights reserved.
//

import UIKit

@objc protocol DetailViewControllerDelegate: class {
    
    func movePopoverTo(rect: CGRect)
    
}



class CustomMenuViewController: UITextView {
    
    @IBOutlet weak var popoverDelegate:DetailViewControllerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willShowMenu), name: NSNotification.Name.UIMenuControllerWillShowMenu, object: nil)
        
    }
    
    func willShowMenu(){
        
        DispatchQueue.main.async {
            
            UIMenuController.shared.setMenuVisible(false, animated: false)
            
            if let selectedRectEnd = self.selectedTextRange?.end {
                if let selectedRectStart = self.selectedTextRange?.start {
                    
                    let start = self.caretRect(for: selectedRectStart)
                    let end = self.caretRect(for: selectedRectEnd)
                    let unionRect = start.union(end)
                    
                    
                    
                    self.popoverDelegate?.movePopoverTo(rect: self.convert(unionRect, to: self.superview))
                    
                }
            }
            
            
        }
    }
}
