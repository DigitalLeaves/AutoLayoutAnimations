//
//  SizeAnimationsViewController.swift
//  AutoLayoutAnimations
//
//  Created by Ignacio Nieto Carvajal on 27/4/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

import UIKit

class SizeAnimationsViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    // data
    let initialSize: CGFloat = 64.0
    var animating = false
    
    func startAnimations() {
        if animating { return }
        animating = true
        
        self.switchConstraintForBoxView()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded() // NOTE: it needs to be called for the superview "Use this method to force the layout of subviews before drawing"
        }) { (success) in
            self.animating = false
        }
        
    }
    
    func switchConstraintForBoxView() {
        if heightConstraint.constant == initialSize {
            heightConstraint.constant = 2 * initialSize
            widthConstraint.constant = 2 * initialSize
        } else {
            heightConstraint.constant = initialSize
            widthConstraint.constant = initialSize
        }
    }
    
    // MARK: - Button actions
    
    @IBAction func animate(_ sender: Any) {
        startAnimations()
    }
    
    @IBAction func cancelAndLeave(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
