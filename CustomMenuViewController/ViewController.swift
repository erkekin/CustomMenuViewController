//
//  ViewController.swift
//  CustomMenuViewController
//
//  Created by Erk Ekin on 06/10/2016.
//  Copyright © 2016 Erk Ekin. All rights reserved.
//

import UIKit




class ViewController: UIViewController , DetailViewControllerDelegate, UIPopoverPresentationControllerDelegate, UITextViewDelegate{
    
    var isPopoverVisible = false;
    var filterDistanceViewController:UIViewController!
    @IBOutlet weak var textView: CustomMenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterDistanceViewController = (self.storyboard?.instantiateViewController(withIdentifier: "popover"))!
        self.filterDistanceViewController.modalPresentationStyle = UIModalPresentationStyle.popover
        self.filterDistanceViewController.preferredContentSize = CGSize(width: 150, height: 40)
        
        textView.popoverDelegate = self;
        textView.delegate = self
        
        let theString = "<p class='indented'>You don't know about me without you have read a book by the name of <em>The Adventures of Tom Sawyer</em>;  but that ain't no matter. That book was made by Mr. Mark Twain, and he told the truth, mainly. There was   things which he stretched, but mainly he told the truth. That is nothing. I never seen anybody but lied one   time or another, without it was Aunt Polly, or the widow, or maybe Mary. Aunt Polly -- Tom's Aunt Polly, she   is -- and Mary, and the Widow Douglas is all told about in that book, which is mostly a true book, with some   stretchers, as I said before. - Opening to <em>Huck Finn</em></p> "
        
        let theAttributedString = try! NSAttributedString(data: theString.data(using: String.Encoding.utf8, allowLossyConversion: false)!,options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                                                          documentAttributes: nil)
        
        textView.attributedText = theAttributedString
        
    }
    
    func movePopoverTo(rect: CGRect)
    {
        if  self.isPopoverVisible == true {
            if let popoverPresentationViewController = self.filterDistanceViewController.popoverPresentationController
            {
                popoverPresentationViewController.sourceRect = rect
            }
            return
            
        }
        
        DispatchQueue.main.async {
            
            if let popoverPresentationViewController = self.filterDistanceViewController.popoverPresentationController
            {
                popoverPresentationViewController.permittedArrowDirections = [.up, .down]
                popoverPresentationViewController.delegate = self
                
                popoverPresentationViewController.sourceView = self.view;
                
                popoverPresentationViewController.sourceRect = rect
                
                self.present(self.filterDistanceViewController, animated: true, completion: nil)
                self.isPopoverVisible = true
            }

        }
        
    }
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        
          self.isPopoverVisible = false
    }
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        
        textView.selectedTextRange = nil;
        
        return true
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
    
}

