//
//  WeatherAppView.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 15/11/2025.
//

import SwiftUI

struct WeatherAppView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "California")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: isNight ? 35 : 42)
                HStack(spacing: 10) {
                    WeatherDayView(daysOfWeek: "Mon", imageName: "cloud.sun.fill", temperature: 30)
                    WeatherDayView(daysOfWeek: "Tue", imageName: "cloud.sun.bolt.fill", temperature: 32)
                    WeatherDayView(daysOfWeek: "Wed", imageName: "cloud.sun.rain.fill", temperature: 35)
                    WeatherDayView(daysOfWeek: "Thu", imageName: "thermometer.sun.fill", temperature: 29)
                    WeatherDayView(daysOfWeek: "Fri", imageName: "cloud.sun.fill", temperature: 38)
                    WeatherDayView(daysOfWeek: "Sat", imageName: "cloud.sun.bolt.fill", temperature: 35)
                    WeatherDayView(daysOfWeek: "Sun", imageName: "cloud.sun.fill", temperature: 40)
                }
                Spacer()
                
                Button {
                    print("Button is Tapped!")
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .white,
                                  backGroundColor: .mint)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    WeatherAppView()
}

struct WeatherDayView: View {
    
    var daysOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        HStack {
            VStack {
                Text(daysOfWeek)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.white)
                Image(systemName: imageName)
                // .renderingMode(.original)
                    .symbolRenderingMode(.multicolor) // this will change the color of symbols
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 23, weight: .medium))
                    .foregroundStyle(.white)
            }
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        //        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue ,
        //                                                   isNight ? .gray : Color("LightBlue")]),
        //                       startPoint: .topLeading, endPoint: .bottomTrailing)
        // .ignoresSafeArea(edges: .all)
        
        // Alternate way is this
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea(edges: .all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .foregroundStyle(.white)
            .font(.system(size: 32, weight: .medium))
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}


