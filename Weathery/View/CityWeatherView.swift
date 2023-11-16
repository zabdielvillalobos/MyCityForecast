//
//  CityWeatherView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct CityWeatherView: View {
    /// The View Model doing all the work for our view.
    let viewModel: CityWeatherVM
    @ObservedObject var unit: changeUnitVM
    
    var body: some View {
        VStack {
            Spacer()
            Text(viewModel.cityName)
                .font(.system(size: 25, weight: .bold, design: .default))
            Spacer()
            if (unit.currOption == "Kelvin") {
                Text(viewModel.formattedCurrentTemp)
                    .font(.system(size: 90, weight: .bold, design: .default))
            }
            if (unit.currOption == "Celcius") {
                Text(viewModel.formattedCurrentTempC)
                    .font(.system(size: 90, weight: .bold, design: .default))
            }
            if (unit.currOption == "Farenheit") {
                Text(viewModel.formattedCurrentTempF)
                    .font(.system(size: 90, weight: .bold, design: .default))
            }
            HStack {
                if (unit.currOption == "Kelvin") {
                    Text("High: \(viewModel.tempHigh)")
                }
                if (unit.currOption == "Celcius") {
                    Text("High: \(viewModel.tempHighC)")
                }
                if (unit.currOption == "Farenheit") {
                    Text("High: \(viewModel.tempHighF)")
                }
                if (unit.currOption == "Kelvin") {
                    Text("Low: \(viewModel.tempLow)")
                }
                if (unit.currOption == "Celcius") {
                    Text("Low: \(viewModel.tempLowC)")
                }
                if (unit.currOption == "Farenheit") {
                    Text("Low: \(viewModel.tempLowF)")
                }
            }
            Spacer()
            VStack {
                Image(systemName: "\(viewModel.icon)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.black)
                Text("\(viewModel.desc)")
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 10))
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView(viewModel: CityWeatherVM(model: Weather.example), unit: changeUnitVM())
    }
}

