//
//  ContentView.swift
//  TempConverter
//
//  Created by Thomas DURAND on 17/01/2020.
//  Copyright © 2020 Thomas DURAND. All rights reserved.
//

import SwiftUI

struct ConverterView<T: Converter>: View {
    let converter: T

    @State private var inputValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1

    var output: Measurement<Dimension> {
        let decimalInputValue = Double(inputValue) ?? 0
        let inputDimension = converter.units[inputUnit]
        let outputDimension = converter.units[outputUnit]
        return Measurement(value: decimalInputValue, unit: inputDimension).converted(to: outputDimension)
    }

    var formatter: MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        return formatter
    }

    var body: some View {
        Form {
            Section(header: Text("What's the input \(converter.name.lowercased())?")) {
                TextField("Enter a \(converter.name.lowercased())", text: $inputValue)
                    .keyboardType(.decimalPad)

                UnitSelectorView(units: converter.units, selection: $inputUnit)
            }
            Section(header: Text("What's the expected output unit?")) {
                UnitSelectorView(units: converter.units, selection: $outputUnit)
            }
            Section(header: Text("Converted \(converter.name.lowercased())")) {
                Text("\(output, formatter: formatter)")
            }
        }
        .navigationBarTitle("\(converter.name) converter")
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView(converter: Temperature())
    }
}
