//
//  ViewController.swift
//  CustomMenuViewController
//
//  Created by Erk Ekin on 06/10/2016.
//  Copyright © 2016 Erk Ekin. All rights reserved.
//

import UIKit

class ViewController: UIViewController , DetailViewControllerDelegate, UIPopoverPresentationControllerDelegate{
    
    var filterDistanceViewController:UIViewController!
    @IBOutlet weak var textView: CustomMenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterDistanceViewController = (self.storyboard?.instantiateViewController(withIdentifier: "popover"))!
        self.filterDistanceViewController.modalPresentationStyle = UIModalPresentationStyle.popover
        self.filterDistanceViewController.preferredContentSize = CGSize(width: 375, height: 113)
        
        textView.popoverDelegate = self;
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func movePopoverTo(rect: CGRect) {
        
        
        self.showPopover(rect: rect)
        
    }
    
    @IBAction func showPopover(rect: CGRect)
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
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

