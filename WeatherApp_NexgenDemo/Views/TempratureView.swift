//
//  TempratureView.swift
//  WeatherApp_NexgenDemo
//
//  Created by Divya Pratap on 16/12/23.
//

import Foundation
import SwiftUI

struct TemperatureView: View {
    let temperature: String
    
    var body: some View {
        VStack {
            Text("Temperature: \(temperature)")
                .font(.custom("Arial", size: 40))
                .padding()
        }
    }
}
