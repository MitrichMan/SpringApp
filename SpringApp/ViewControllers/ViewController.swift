//
//  ViewController.swift
//  SpringApp
//
//  Created by Dmitrii Melnikov on 16.03.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    @IBOutlet var animatedView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    
    @IBOutlet var runButton: SpringButton!
    
    private var nextAnimation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextAnimation = getRandomAnimation()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        runButton.setTitle("Run \(nextAnimation)", for: .normal)
    }
    
    @IBAction func runButtonTapped(_ sender: SpringButton) {
        animatedView.animation = nextAnimation
        animatedView.curve = getRandomCurve()
        
        animatedView.force = getRandomValue()
        animatedView.duration = getRandomValue()
        animatedView.delay = getRandomValue()
        
        setupLabels()
        
        animatedView.animate()
        
        nextAnimation = getRandomAnimation()
    }
}

private extension ViewController {
    func getRandomAnimation() -> String {
        let animations = AnimationPreset.allCases.shuffled()
        let randomIndex = Int.random(in: 0...animations.count - 1)
        let animation = animations[randomIndex].rawValue
        return animation
    }
    
    func getRandomCurve() -> String {
        let curves = AnimationCurve.allCases.shuffled()
        let randomIndex = Int.random(in: 0...curves.count - 1)
        let curve = curves[randomIndex].rawValue
        return curve
    }
    
    func getRandomValue() -> Double {
        let randomValue = Double.random(in: 0.1...2)
        return randomValue
    }
    
    func string(from value: Double) -> String {
        return String(format: "%.2f", value)
    }
    
    func setupLabels() {
        presetLabel.text = "Preset: \(animatedView.animation)"
        forceLabel.text = "Force: \(string(from: animatedView.force))"
        durationLabel.text = "Duration: \(string(from: animatedView.duration))"
        delayLabel.text = "Delay: \(string(from: animatedView.delay))"
        curveLabel.text = "Curve: \(animatedView.curve)"
    }
}
