//
//  WeatherViewModel.swift
//  WeatherApp_NexgenDemo
//
//  Created by Divya Pratap on 16/12/23.
//

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    private var webservice: WeatherService!
    
    @Published var weather = Weather()
    @Published var showTemperatureView = false 
    
    var temperature: String {
        if let temp = self.weather.temp {
            let celsiusTemp = kelvinToCelsius(temp)
            return formatTemperature(celsiusTemp)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    init(){
        self.webservice = WeatherService()
    }
    
    func search(){
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String){
        self.webservice.getWeather(city: city) { weather in
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                    self.showTemperatureView = true // Set to true when weather is received
                }
            }
        }
    }
    
    private func formatTemperature(_ temperature: Double) -> String {
        return String(format: "%0.f", temperature)
    }
    
    private func kelvinToCelsius(_ kelvin: Double) -> Double {
        return kelvin - 273.15
    }
}
