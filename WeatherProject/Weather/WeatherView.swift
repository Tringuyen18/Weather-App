//
//  WeatherView.swift
//  WeatherProject
//
//  Created by Trí Nguyễn on 13/12/2021.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud").font(.system(size: 45))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 120, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer().frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1502899576159-f224dc2349fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80")) { image in
                        image
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                    
                }.frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.sun", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.sun", name: "Max temp temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corner: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
