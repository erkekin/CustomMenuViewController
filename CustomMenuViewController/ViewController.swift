//
//  ViewController.swift
//  CustomMenuViewController
//
//  Created by Erk Ekin on 06/10/2016.
//  Copyright © 2016 Erk Ekin. All rights reserved.
//

import UIKit




class ViewController: UIViewController , DetailViewControllerDelegate, UIPopoverPresentationControllerDelegate, UITextViewDelegate{
    
    var filterDistanceViewController:UIViewController!
    @IBOutlet weak var textView: CustomMenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterDistanceViewController = (self.storyboard?.instantiateViewController(withIdentifier: "popover"))!
        self.filterDistanceViewController.modalPresentationStyle = UIModalPresentationStyle.popover
        self.filterDistanceViewController.preferredContentSize = CGSize(width: 150, height: 40)
        
        textView.popoverDelegate = self;
        textView.delegate = self
        
        let theString = "<h1>H1 title</h1><b>Logo</b><center><font color='red'>deneme</font><br>~end~"
        
        let theAttributedString = try! NSAttributedString(data: theString.data(using: String.Encoding.utf8, allowLossyConversion: false)!,options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                                                          documentAttributes: nil)
        
        textView.attributedText = theAttributedString
        
    }
    
    func movePopoverTo(rect: CGRect)
    {
        
        DispatchQueue.main.async {
            let popoverPresentationViewController = self.filterDistanceViewController.popoverPresentationController
            popoverPresentationViewController?.permittedArrowDirections = [.up, .down]
            popoverPresentationViewController?.delegate = self
            
            popoverPresentationViewController?.sourceView = self.view;
            
            self.filterDistanceViewController.popoverPresentationController?.sourceRect = rect
            
            self.present(self.filterDistanceViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        
        textView.selectedTextRange = nil;
        
        return true
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
    
}

