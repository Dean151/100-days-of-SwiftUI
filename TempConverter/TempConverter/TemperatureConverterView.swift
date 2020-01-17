//
//  ContentView.swift
//  TempConverter
//
//  Created by Thomas DURAND on 17/01/2020.
//  Copyright © 2020 Thomas DURAND. All rights reserved.
//

import SwiftUI

struct TemperatureConverterView: View {
    @State private var inputTemperature = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1

    var outputTemperature: Measurement<UnitTemperature> {
        let decimalTemperature = Double(inputTemperature) ?? 0
        let inputTempUnit = TemperatureUnitSelectorView.temperatureUnits[inputUnit]
        let outputTempUnit = TemperatureUnitSelectorView.temperatureUnits[outputUnit]
        return Measurement(value: decimalTemperature, unit: inputTempUnit).converted(to: outputTempUnit)
    }

    var temperatureFormatter: MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        return formatter
    }

    var body: some View {
        return NavigationView {
            Form {
                Section(header: Text("What's the input temperature?")) {
                    TextField("Enter a temperature", text: $inputTemperature)
                        .keyboardType(.decimalPad)

                    TemperatureUnitSelectorView(selection: $inputUnit)
                }
                Section(header: Text("What's the expected output unit?")) {
                    TemperatureUnitSelectorView(selection: $outputUnit)
                }
                Section(header: Text("Converted temperature")) {
                    Text("\(outputTemperature, formatter: temperatureFormatter)")
                }
            }
            .navigationBarTitle("Temperature Converter")
        }
    }
}

struct TemperatureUnitSelectorView: View {
    static let temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    var selection: Binding<Int>

    var body: some View {
        Picker("", selection: selection) {
            ForEach(0 ..< Self.temperatureUnits.count) {
                Text("\(Self.temperatureUnits[$0].symbol)")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct TemperatureConverterView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureConverterView()
    }
}
