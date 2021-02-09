//
//  PhotoAlbumViewController.swift
//  PhotoFrame
//
//  Created by HOONHA CHOI on 2021/02/09.
//

import UIKit

class PhotoAlbumViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoAlbumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextImageButtonTouched(_ sender: Any) {
        imageTransitionAnimate()
        labelAlpha()
    }
}

extension PhotoAlbumViewController {
    
    func randomImageSelect() -> String {
        let number = Int.random(in: 1...22)
        return String(format: "%02d.jpg", number)
    }
    
    func imageTransitionAnimate() {
        UIView.transition(with: self.photoImageView,
                          duration: 1.0,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.photoImageView.image = UIImage(named: self.randomImageSelect())
                          }, completion: nil)
    }
    
    func labelAlpha() {
        UIView.animate(withDuration: 0.5) {
            self.photoAlbumLabel.alpha = 1
        }
    }
}
