//
//  YellowViewController.swift
//  PhotoFrame
//
//  Created by HOONHA CHOI on 2021/02/09.
//

import UIKit

class YellowViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var closeButtonConstraintBottom: NSLayoutConstraint!
    @IBOutlet weak var closeButtonConstraintCenterX: NSLayoutConstraint!
    
    @IBOutlet weak var nextButtonConstraintCenterY: NSLayoutConstraint!
    @IBOutlet weak var nextButtonConstraintCenterX: NSLayoutConstraint!
     
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#file, #line, #function, #column)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        closeButtonMoveAnimation()
        print(#file, #line, #function, #column)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#file, #line, #function, #column)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#file, #line, #function, #column)
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        viewCloseAnimation()
    }
}


extension YellowViewController {
    
    func closeButtonMoveAnimation() {
        closeButtonConstraintBottom.constant = self.view.frame.height/2 - 100
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    func viewCloseAnimation() {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: []) {
            self.leftMoveAnimation(self.nextButtonConstraintCenterX)
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
            self.upMoveAnimation(self.nextButtonConstraintCenterY)
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.zeroAlphaView(self.nextButton)
                self.view.layoutIfNeeded()
            }
            self.leftMoveAnimation(self.closeButtonConstraintCenterX)
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
            self.upMoveAnimation(self.closeButtonConstraintBottom)
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.zeroAlphaView(self.closeButton)
                self.view.layoutIfNeeded()
            }
        } completion: { (Finished) in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func leftMoveAnimation(_ constraint : NSLayoutConstraint) {
        constraint.constant = -(self.view.frame.width/3)
    }
    func upMoveAnimation(_ constraint : NSLayoutConstraint) {
        constraint.constant = -150
    }
    func zeroAlphaView(_ view : UIView) {
        view.alpha = 0
    }
}
