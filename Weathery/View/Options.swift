//
//  Options.swift
//  Weathery
//
//  Created by Zabdiel Villalobos on 11/16/23.
//

import SwiftUI

struct OptionsView: View {
    
    var options = ["Celsius", "Kelvin", "Farenheit"]
    @ObservedObject var unit: changeUnitVM

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Units", selection: $unit.currOption) {
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
        }
    }
    
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(unit: changeUnitVM())
    }
}
