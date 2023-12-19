//
//  WeatherService.swift
//  WeatherApp_NexgenDemo
//
//  Created by Divya Pratap on 16/12/23.
//

import Foundation

class WeatherService{
    func getWeather(city: String, completion: @escaping (Weather?) -> ()){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a6a4195b023ec8f56ad7bf2b4f189225") else{
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url){data, response , error in
            guard let data = data , error == nil else{
                completion(nil)
                return
            }
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse{
                let weather = weatherResponse.main
                completion(weather)
            }else{
                completion(nil)
            }
        }.resume()
    }
}
