//
//  ContentView.swift
//  Weather
//
//  Created by 杨小涵 on 2022/9/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather{
                    WeatherView(weather: weather)
                } else{
                    LoadingView()
                        .task{
                            do{
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch{
                                print("Error getting weather :\(error)")
                            }
                        
                        }
                }
            } else{
                if locationManager.isLoading{
                    LoadingView()
                } else{
                    WelcomeView()
                        .environmentObject(locationManager)
                    
                }
            }
            
        
           
        }
        .background(Color(hue: 0.752, saturation: 0.177, brightness: 0.706))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
