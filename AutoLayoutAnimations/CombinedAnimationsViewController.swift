//
//  CombinedAnimationsViewController.swift
//  AutoLayoutAnimations
//
//  Created by Ignacio Nieto Carvajal on 27/4/17.
//  Copyright © 2017 Digital Leaves. All rights reserved.
//

import UIKit

class CombinedAnimationsViewController: UIViewController {
    // outlets
    @IBOutlet weak var animateButton: UIButton!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    // data
    var animating = false
    let initialSize: CGFloat = 64.0
    let initialPosition: CGFloat = 16.0
    let finalXPosition = UIScreen.main.bounds.width - 16 - (64 * 2)
    let finalYPosition = UIScreen.main.bounds.height - (16 * 2) - 60 - (64 * 2)
    
    func startAnimations() {
        if animating { return }
        animating = true
        
        self.switchConstraintForBoxView()
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.autoreverse, .repeat], animations: {
            self.view.layoutIfNeeded() // NOTE: it needs to be called for the superview "Use this method to force the layout of subviews before drawing"
        }, completion: nil)
    }
    
    func switchConstraintForBoxView() {
        if topConstraint.constant == initialPosition {
            topConstraint.constant = finalYPosition
            leadingConstraint.constant = finalXPosition
            heightConstraint.constant = 2 * initialSize
            widthConstraint.constant = 2 * initialSize
        } else {
            topConstraint.constant = initialPosition
            leadingConstraint.constant = initialPosition
            heightConstraint.constant = initialSize
            widthConstraint.constant = initialSize
        }
    }
    
    // MARK: - Button actions
    
    @IBAction func animate(_ sender: Any) {
        if animating {
            boxView.layer.removeAllAnimations()
            switchConstraintForBoxView()
            self.view.layoutIfNeeded()
            animating = false
            self.animateButton.setTitle("Animate", for: .normal)
        } else {
            self.animateButton.setTitle("Stop animations", for: .normal)
            startAnimations()
        }
    }
    
    @IBAction func cancelAndLeave(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
