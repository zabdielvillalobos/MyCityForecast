//
//  City.swift
//  Weathery
//
//  Created by Zabdiel Villalobos on 11/16/23.
//

import SwiftUI

struct AddCityView: View {
    
    @State var cityName = ""
    @ObservedObject var viewModel: WeatherDataViewModel
    @ObservedObject var dm: ClearSheet
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section(header: Text("Add a City")) {
                        TextField("Enter a City Name", text: $cityName)
                            .onSubmit {
                                viewModel.getWeather(cityString: "\(cityName)")
                            }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button() {
                            dm.showing.toggle()
                        } label: {
                            Text("Close")
                        }
                    }
                }
                
            }
        }
    }
    
    struct AddCityView_Previews: PreviewProvider {
        static var previews: some View {
            AddCityView(viewModel: WeatherDataViewModel(), dm: ClearSheet())
        }
    }
}

