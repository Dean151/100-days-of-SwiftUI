//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Thomas Durand on 18/01/2020.
//  Copyright © 2020 Thomas Durand. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var score = 0
    @State private var animating: Int?

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
        }
        withAnimation {
            self.animating = number
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.askQuestion()
        }
    }

    func askQuestion() {
        animating = nil
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of ")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                ForEach(0 ..< 3, content: self.flag)

                Spacer()

                Text("Current score: \(score)")
            }
        }
        .foregroundColor(.white)
    }

    func flag(for number: Int) -> some View {
        Button(action: {
           self.flagTapped(number)
        }) {
            Image(self.countries[number])
                .renderingMode(.original)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                .shadow(color: .black, radius: 2)
        }
        .rotation3DEffect(
            .degrees(number == self.correctAnswer && self.animating == number ? 360 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .disabled(self.animating != nil)
        .opacity(self.animating != nil && number != self.correctAnswer ? 0.25 : 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
