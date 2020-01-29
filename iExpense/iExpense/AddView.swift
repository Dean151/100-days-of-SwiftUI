//
//  SwiftUIView.swift
//  iExpense
//
//  Created by Thomas DURAND on 29/01/2020.
//  Copyright © 2020 Thomas DURAND. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""

    static let types = ["Business", "Personal"]

    var canSave: Bool {
        return !name.isEmpty && Int(amount) != nil
    }

    func save() {
        if let actualAmount = Int(self.amount) {
            let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
            self.expenses.items.append(item)
        }
        close()
    }

    func close() {
        self.presentationMode.wrappedValue.dismiss()
    }

    var cancelButton: some View {
        Button("Cancel", action: close)
    }

    var saveButton: some View {
        Button("Save", action: save).disabled(!canSave)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(leading: cancelButton, trailing: saveButton)
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
