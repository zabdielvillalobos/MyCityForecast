//
//  ContentView.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherDataViewModel()
    @StateObject var dm = ClearSheet()
    @StateObject var unit = changeUnitVM()
    
    var body: some View {
            NavigationStack {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [.white, .gray]),
                                   startPoint: .center,
                                   endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.weatherData) { weather in
                                CityWeatherView(viewModel: CityWeatherVM(model: weather), unit: unit)
                            }
                        }
                    }
                    .padding(.top, 20)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            LazyHStack {
                                Text("WEATHER")
                                    .font(.largeTitle)
                                    .padding(.trailing, 5)
                                Image(systemName: "cloud.sun")
                                    .padding(.trailing, 75)
                                
                                NavigationLink(destination: OptionsView(unit: unit)) {
                                    Image(systemName: "gear")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 35)
                                }
                                Button() {
                                    dm.showing.toggle()
                                } label: {
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30)
                                }
                                .sheet(isPresented: $dm.showing) {
                                    AddCityView(viewModel: viewModel, dm: dm)
                                }
                            }
                        }
                }
                }
            }
        }
    }
    // MARK: This onAppear modifier is just fetching the data for Charlotte when this view appears. You can get rid of it

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
