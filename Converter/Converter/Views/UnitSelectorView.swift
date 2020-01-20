//
//  UnitSelectorView.swift
//  Converter
//
//  Created by Thomas DURAND on 20/01/2020.
//  Copyright © 2020 Thomas DURAND. All rights reserved.
//

import SwiftUI

struct UnitSelectorView<T: Dimension>: View {
    let units: [T]
    var selection: Binding<Int>

    var body: some View {
        Picker("", selection: selection) {
            ForEach(0 ..< units.count) {
                Text("\(self.units[$0].symbol)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct UnitSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        UnitSelectorView(units: [UnitTemperature.celsius, .fahrenheit, .kelvin], selection: .constant(0))
    }
}
