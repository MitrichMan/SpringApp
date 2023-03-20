//
//  Animation.swift
//  SpringApp
//
//  Created by Dmitrii Melnikov on 20.03.2023.
//

struct Animation: CustomStringConvertible {
    let name: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
    """
    Preset: \(name)
    Curve: \(curve)
    Force: \(String(format: "%.02f", force))
    Duration: \(String(format: "%.02f", duration))
    Delay: \(delay)
    """
    }
    
    static func getRandomAnimation() -> Animation {
        Animation(
            name: DataStore.shared.animations.randomElement()?.rawValue ?? "slideLeft",
            curve: DataStore.shared.curves.randomElement()?.rawValue ?? "easeIn",
            force: Double.random(in: 1...2),
            duration: Double.random(in: 0.8...1.6),
            delay: 2
        )
    }
}
