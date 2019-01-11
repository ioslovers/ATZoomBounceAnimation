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
        case 0:
            imageView.image = UIImage(named: "apple.png")
            break
        case 1:
            imageView.image = UIImage(named: "orange.png")
            break
        case 2:
            imageView.image = UIImage(named: "mango.png")
            break
        default:
            break
        }
        let tapGet = UITapGestureRecognizer(target: self, action: #selector(closeButtonAction(_:)))
        view.addGestureRecognizer(tapGet)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
