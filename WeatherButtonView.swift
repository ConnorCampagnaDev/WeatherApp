//
//  WeatherButtonView.swift
//  WeatherApp
//
//  Created by Connor Campagna on 20/02/2021.
//

import SwiftUI

struct WeatherButtonView: View {
  
    var title : String
    var textColor : Color
    var backgroundColor : Color
    
    var body: some View {
        
        Text(title)
            .frame(width: 280.0, height: 50.0)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(20)
        
    }
}
