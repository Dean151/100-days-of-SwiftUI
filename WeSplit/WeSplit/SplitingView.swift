//
//  ContentView.swift
//  WeSplit
//
//  Created by Thomas DURAND on 17/01/2020.
//  Copyright © 2020 Thomas DURAND. All rights reserved.
//

import SwiftUI

struct SplitingView: View {

    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"

    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var tipPercentage = 2

    var grandTotal: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])

        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }

    var totalPerPerson: Double {
        let peopleCount = Int(numberOfPeople) ?? 0
        if peopleCount == 0 {
            return 0
        }
        return grandTotal / Double(peopleCount)
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)

                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.numberPad)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Total amount")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                }

                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct SplitingView_Previews: PreviewProvider {
    static var previews: some View {
        SplitingView()
    }
}
