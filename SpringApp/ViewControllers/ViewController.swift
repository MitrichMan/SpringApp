//
//  ViewController.swift
//  SpringApp
//
//  Created by Dmitrii Melnikov on 16.03.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
   
//MARK: - IB outlets
    @IBOutlet var animatedView: SpringView!
    @IBOutlet var animationParametersLabel: SpringLabel! {
        didSet {
            animationParametersLabel.text = animation.description
        }
    }
    
//MARK: - Private properties
    private var animation = Animation.getRandomAnimation()

//MARK: - IB actions
    @IBAction func runButtonTapped(_ sender: UIButton) {
        setAnimationToLabel()
        
        animatedView.animation = animation.name
        animatedView.curve = animation.curve
        animatedView.force = animation.force
        animatedView.duration = animation.duration
        animatedView.delay = animation.delay
        animatedView.animate()
        
        animation = Animation.getRandomAnimation()
        sender.setTitle("Run \(animation.name)", for: .normal)
    }
    
    private func setAnimationToLabel() {
        animationParametersLabel.animation = "fall"
        animationParametersLabel.animate()
        animationParametersLabel.text = animation.description
        animationParametersLabel.animateNext { [unowned self] in
            animationParametersLabel.animation = "slideDown"
            animationParametersLabel.animate()
        }
    }
}

