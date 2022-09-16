//
//  ContentView.swift
//  weatherapp
//
//  Created by Bala Krishna on 15/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            
            MainWeatherStatusView( imageName : isNight ? "moon.stars.fill" : "cloud.sun.fill", isNight: $isNight)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct WeatherDetailsView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor : Color
    var bottomColor : Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainWeatherStatusView: View {
    
    var imageName : String
    
    @Binding var isNight : Bool
    
    var body: some View {
        VStack{
            Text("New Delhi")
                .font(.system(size: 32, weight: .semibold, design: .default))
                .foregroundColor(.white)
                .padding()
            VStack (spacing: 8){
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
                Text("76°")
                    .font(.system(size: 60, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 60)
            
            HStack (spacing : 20){
                WeatherDetailsView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                WeatherDetailsView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 76)
                WeatherDetailsView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 76)
                WeatherDetailsView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 76)
                WeatherDetailsView(dayOfWeek: "SAT", imageName: "snow", temperature: 76)
                
            }
            Spacer()
            
            Button {
                isNight.toggle()
                print("Tapped")
            } label: {
                Text("Change Date Time")
                    .frame(width: 280, height: 50)
                    .background(Color.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .cornerRadius(10)
            }
            
            
            Spacer()
            
        }
    }
}
