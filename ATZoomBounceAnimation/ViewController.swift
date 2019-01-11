//
//  ViewController.swift
//  ATZoomBounceAnimation
//
//  Created by Ashish Tripathi on 11/01/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var bigButton: UIButton!
    let popAnimator = ATZoomBounceAnimation()
    var arrayButton = [UIButton]()
    var clickedButtonTag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayButton = [appleButton, orangeButton, bananaButton, bigButton]
        popAnimator.dismissCompletion = {
            let button = self.arrayButton[self.clickedButtonTag]
            button.isHidden = false
        }
    }

    @IBAction func appleButtonAction(_ sender: Any) {
        presentDetailViewController(sender: sender)
    }
    
    @IBAction func orangeButtonAction(_ sender: Any) {
        presentDetailViewController(sender: sender)
    }
    
    @IBAction func bananaButtonAction(_ sender: Any) {
       presentDetailViewController(sender: sender)
    }
    
    @IBAction func bigButtonAction(_ sender: Any) {
        presentDetailViewController(sender: sender)
    }
    
    func presentDetailViewController(sender: Any) {
        let button = sender as! UIButton
        let details = storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        details.transitioningDelegate = self
        clickedButtonTag = button.tag
        details.selectedIndex = button.tag
        present(details, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let button = arrayButton[clickedButtonTag]
        popAnimator.originFrame = button.frame
        
        popAnimator.presenting = true
        button.isHidden = true
        
        return popAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popAnimator.presenting = false
        return popAnimator
    }
}
