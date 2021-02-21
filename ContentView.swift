//
//  ContentView.swift
//  WeatherApp
//
//  Created by Connor Campagna on 18/02/2021.
//

import SwiftUI

struct ContentView: View {
    
   @State private var isNight = false
    
    var body: some View {
        ZStack {
                BackgroundView(isNight: $isNight)
            VStack {
            
                CityTextView(cityName: "Cupertino,CA")
                
                MainWeatherStatus(temp: 20, isNight: $isNight)
                
                HStack(spacing:15) {
                    WeatherDayView(dotw: "Tue", img: "cloud.sun.fill", temp: 19)
                    WeatherDayView(dotw: "Wed", img: "sun.max.fill", temp: 21)
                    WeatherDayView(dotw: "Thu", img: "cloud.sun.fill", temp: 17)
                    WeatherDayView(dotw: "Fri", img: "cloud.sun.fill", temp: 20)
                    WeatherDayView(dotw: "Sat", img: "sun.max.fill", temp: 22)
                    WeatherDayView(dotw: "Sun", img: "cloud.rain.fill", temp: 18)
                }
                Spacer()
                
                Button(action: {
                        isNight.toggle()
                    
                }, label: {
                    WeatherButtonView(title: "Change Day Time",
                                      textColor: .blue,
                                      backgroundColor: .white)
                })
                
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
    
    var dotw : String
    var img : String
    var temp : Int
    
    var body: some View {
        VStack {
            Text(dotw)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.white)
            Image(systemName: img)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40.0, height: 40.0)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(Color.white)
            
            
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight :Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}



struct CityTextView : View {
    
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .padding()
    }
}

struct MainWeatherStatus: View {
    
    var temp : Int
    @Binding var isNight :Bool
    
    var body: some View {
       
        VStack(spacing : 10) {
            
                Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180.0, height: 180.0)
                  
                Text("20°")
                    .font(.system(size: 72, weight: .medium))
                    .foregroundColor(Color.white)
        }
        .padding(.bottom, 20)
    }
}


