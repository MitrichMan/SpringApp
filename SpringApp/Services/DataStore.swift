//
//  DataStore.swift
//  SpringApp
//
//  Created by Dmitrii Melnikov on 20.03.2023.
//

import SpringAnimation

final class DataStore {
    static let shared = DataStore()
    
    let animations = AnimationPreset.allCases
    
    let curves = AnimationCurve.allCases
    
    private init() {}
}
