//
//  WeatherRow.swift
//  Weather
//
//  Created by 杨小涵 on 2022/9/22.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
        var name: String
        var value: String
        
        var body: some View {
            HStack(spacing: 20) {
                Image(systemName: logo)
                    .font(.title)
                    .frame(width: 20, height: 20)
                    .padding()
                    .foregroundColor(Color(red: 0.328, green: 0.156, blue: 0.335))
                    .background(Color.white)
                    .cornerRadius(50)

                
                VStack(alignment: .leading, spacing: 8) {
                    Text(name)
                        .font(.caption)
                        .bold()
                    
                    Text(value)
                        .bold()
                        .font(.title)
                }
            }
        }
    }

    struct WeatherRow_Previews: PreviewProvider {
        static var previews: some View {
            WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
        }
    }

