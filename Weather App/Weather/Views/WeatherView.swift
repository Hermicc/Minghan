//
//  WeatherView.swift
//  Weather
//
//  Created by 杨小涵 on 2022/9/22.
//

import SwiftUI


struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°C")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    AsyncImage(url: URL(string: "https://media.gettyimages.com/vectors/los-angeles-sunset-scene-with-palm-trees-vector-id506287189?k=20&m=506287189&s=612x612&w=0&h=GRWnWpzxRgMnAmQP21SkIG9JBMrwHufvlJVR_XIMREE=")){ image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 0){
                    Text("Weather now").bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°C"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°C"))
                    }
                
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                            .padding(6.0)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
               
                .background(Color(hue: 0.752, saturation: 0.177, brightness: 0.706))
                .cornerRadius(20,corners: [.topLeft,.topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.752, saturation: 0.177, brightness: 0.706))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
