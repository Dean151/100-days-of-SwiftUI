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
                Duration().row
                Length().row
                Mass().row
                Pressure().row
                Speed().row
                Temperature().row
                Volume().row
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
