//
//  WeatherDataModel.swift
//  WeatherApp_NexgenDemo
//
//  Created by Divya Pratap on 16/12/23.
//

import Foundation

struct WeatherResponse : Decodable{
    let main: Weather
}

struct Weather : Decodable {
    var temp : Double?
}
 
