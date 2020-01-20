//
//  ConverterSelector.swift
//  Converter
//
//  Created by Thomas DURAND on 20/01/2020.
//  Copyright © 2020 Thomas DURAND. All rights reserved.
//

import SwiftUI

struct DimensionSelector: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AnyView(ConverterView(converter: Duration()))) {
                    Text("Duration")
                }
                NavigationLink(destination: AnyView(ConverterView(converter: Length()))) {
                    Text("Length")
                }
                NavigationLink(destination: AnyView(ConverterView(converter: Mass()))) {
                    Text("Mass")
                }
                NavigationLink(destination: AnyView(ConverterView(converter: Pressure()))) {
                    Text("Pressure")
                }
                NavigationLink(destination: AnyView(ConverterView(converter: Speed()))) {
                    Text("Speed")
                }
                NavigationLink(destination: AnyView(ConverterView(converter: Temperature()))) {
                    Text("Temperature")
                }
                NavigationLink(destination: AnyView(ConverterView(converter: Volume()))) {
                    Text("Volume")
                }
            }
            .navigationBarTitle("Converters")
        }
    }
}

struct DimensionSelector_Previews: PreviewProvider {
    static var previews: some View {
        DimensionSelector()
    }
}
