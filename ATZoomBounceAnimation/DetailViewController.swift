//
//  DetailViewController.swift
//  ATZoomBounceAnimation
//
//  Created by Ashish Tripathi on 11/01/19.
//  Copyright © 2019 Ashish Tripathi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIViewControllerTransitioningDelegate {
   
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    public var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch selectedIndex {
        case 0, 3:
            imageView.image = UIImage(named: "apple.png")
            view.backgroundColor = .black
            break
        case 1:
            imageView.image = UIImage(named: "orange.png")
            view.backgroundColor = .white
            break
        case 2:
            imageView.image = UIImage(named: "mango.png")
            break
        default:
            break
        }
        let tapGet = UITapGestureRecognizer(target: self, action: #selector(closeButtonAction(_:)))
        view.addGestureRecognizer(tapGet)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(closeButtonAction(_:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
