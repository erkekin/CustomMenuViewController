//
//  ViewController.swift
//  CustomMenuViewController
//
//  Created by Erk Ekin on 06/10/2016.
//  Copyright © 2016 Erk Ekin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextViewDelegate, UIPopoverPresentationControllerDelegate{
    
    var filterDistanceViewController:UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterDistanceViewController = (self.storyboard?.instantiateViewController(withIdentifier: "popover"))!
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        
        print("selaaam")
        self.filterBooks(rect: textView.caretRect(for: (textView.selectedTextRange?.end)!))
    }
    
    
    @IBAction func filterBooks(rect: CGRect)
    {
        
        DispatchQueue.main.async {
            self.filterDistanceViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            
            self.filterDistanceViewController.preferredContentSize = CGSize(width: 300, height: 200)
            let popoverPresentationViewController = self.filterDistanceViewController.popoverPresentationController
            popoverPresentationViewController?.permittedArrowDirections = .up
            popoverPresentationViewController?.delegate = self
            
            popoverPresentationViewController?.sourceView = self.view;
            
            self.filterDistanceViewController.popoverPresentationController?.sourceRect = rect
            
            self.present(self.filterDistanceViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

