//
//  WeatherViewModel.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import Foundation


/// A wrapper struct that will contain all the logic for presenting our Weather data.
/// It accepts a `Weather` struct, and contains methods for representing the data contained in that struct
struct CityWeatherVM {
    
    /// The weather data being processed by this view model
    let model: Weather
    
    
    // MARK: Here's where you should add logic for different representations of the temperature in Fahrenheit, Celsius, etc. You'll also want to make the methods for representing the other data (e.g., the weather icon)
    
    
    var tempHigh: String {
        guard let high = model.main?.tempMax else { return "No high" }
        return "\(Int(round(high)))K"
    }
    
    var tempHighC: String {
        guard let high = model.main?.tempMax else { return "No high" }
        return "\(Int(round(high - 273.15)))°C"
    }
    
    var tempHighF: String {
        guard let high = model.main?.tempMax else { return "No high" }
        let f = (high - 273.15) * 9/5 + 32
        return "\(Int(round(f)))°F"
    }
    
    var tempLow: String {
        guard let low = model.main?.tempMin else { return "No low" }
        return "\(Int(round(low)))K"
    }
    
    var tempLowC: String {
        guard let low = model.main?.tempMin else { return "No low" }
        return "\(Int(round(low - 273.15)))°C"
    }
    
    var tempLowF: String {
        guard let low = model.main?.tempMin else { return "No low" }
        let f = (low - 273.15) * 9/5 + 32
        return "\(Int(round(f)))°F"
    }
    
    var icon: String {
        guard let text = model.weather?[0].icon else { return "cloud" }
        return "\(text)"
    }
    
    var desc: String {
        guard let text = model.weather?[0].weatherDescription else { return "no description" }
        return "\(text)"
    }
        
    /// A getter that returns the formatted temperature, or "No temp" if no data is available. It's currently in Kelvin.
    var formattedCurrentTemp: String {
        guard let temp = model.main?.temp else { return "No temp" }
        return "\(Int(round(temp)))K"
    }
    
    var formattedCurrentTempC: String {
        guard let temp = model.main?.temp else { return "No temp" }
        return "\(Int(round(temp - 273.15)))°C"
    }
    
    var formattedCurrentTempF: String {
        guard let temp = model.main?.temp else { return "No temp" }
        let f = (temp - 273.15) * 9/5 + 32
        return "\(Int(round(f)))°F"
    }
    

    
    var cityName: String {
        return model.name ?? "No name"
    }
}
