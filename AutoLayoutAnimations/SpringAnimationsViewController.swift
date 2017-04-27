//
//  SpringAnimationsViewController.swift
//  AutoLayoutAnimations
//
//  Created by Ignacio Nieto Carvajal on 27/4/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

import UIKit

class SpringAnimationsViewController: UIViewController {
    // outlets
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    // data
    var animating = false
    let initialValue: CGFloat = 16.0
    
    func startAnimations() {
        if animating { return }
        animating = true
        
        self.switchConstraintForBoxView()
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded() // NOTE: it needs to be called for the superview "Use this method to force the layout of subviews before drawing"
        }) { (success) in
            self.animating = false
        }
    }
    
    func switchConstraintForBoxView() {
        if leadingConstraint.constant == initialValue {
            leadingConstraint.constant = UIScreen.main.bounds.width - 64 - 16
        } else {
            leadingConstraint.constant = initialValue
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
