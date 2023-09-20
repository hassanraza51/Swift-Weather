//
//  WeatherButton.swift
//  Swift-Weather
//
//  Created by Hassan Raza on 18/09/2023.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgrounColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgrounColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
