//
//  WeatherView.swift
//  WeatherApp_NexgenDemo
//
//  Created by Divya Pratap on 16/12/23.
//

import Foundation
import SwiftUI

struct WeatherView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    var body: some View {
           NavigationView {
              
               VStack {
                   Spacer()
                   HStack {
                       TextField("Enter City Name", text: self.$weatherVM.cityName)
                           .font(.custom("", size: 30))
                           .padding(1)
                           
                       
                       Button(action: {
                           self.weatherVM.search()
                       }) {
                           Image("searchIcon")
                               .resizable()
                               .scaledToFit()
                       }
                       .frame(width: 40, height: 40, alignment: .center)
                   }
                   .padding(15)
                   
                   Spacer()
                   NavigationLink(
                       destination: TemperatureView(temperature: self.weatherVM.temperature),
                       isActive: self.$weatherVM.showTemperatureView
                   ) {}
               }
           }
       }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
