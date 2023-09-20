//
//  ContentView.swift
//  Swift-Weather
//
//  Created by Hassan Raza on 14/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Jhang, Punjab")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 35)
                
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.rain.fill", temperature: 47)
                
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 49)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.bolt.fill", temperature: 48)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.bolt.fill", temperature: 46)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.rain.fill", temperature: 45)
                    
                    WeatherDayView(dayOfWeek: "SUN", imageName: "cloud.rain.fill", temperature: 45)
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: Color.blue, backgrounColor: Color.white)
                }
                
                Spacer()
            }
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View { 
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//                                                   isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
    ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


