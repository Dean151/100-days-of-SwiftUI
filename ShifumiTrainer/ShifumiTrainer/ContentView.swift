//
//  ContentView.swift
//  ShifumiTrainer
//
//  Created by Thomas DURAND on 20/01/2020.
//  Copyright © 2020 Thomas DURAND. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    static let moves = ["✋", "👊", "✌️"]

    @State private var shownMoves = Self.moves.shuffled()
    @State private var move = Int.random(in: 0 ..< Self.moves.count)
    @State private var shouldWin = Bool.random()

    @State private var question = 1
    @State private var score = 0
    @State private var showScore = false

    func moveChoosed(at index: Int) {
        let rightAnswerIndex = (Self.moves.count + (shouldWin ? move - 1 : move + 1)) % Self.moves.count
        let haveRightAnswer = shownMoves.firstIndex(of: Self.moves[rightAnswerIndex]) == index
        score += haveRightAnswer ? 1 : -1
        next()
    }

    func next() {
        if question == 10 {
            showScore = true
        } else {
            move = Int.random(in: 0 ..< 3)
            shouldWin = Bool.random()
            question += 1
            shownMoves.shuffle()
        }
    }

    func reset() {
        question = 0
        score = 0
        next()
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: .init(colors: [.white, .orange]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 40) {
                    VStack(spacing: 10) {
                        Text("Turn \(question) out of 10")
                            .fontWeight(.medium)
                        Text(shouldWin ? "Win against \(Self.moves[move])" : "Loose against \(Self.moves[move])")
                            .font(.title)
                            .fontWeight(.black)
                    }
                    moveSelector
                    Text("Current score: \(score)")
                        .fontWeight(.black)
                    Spacer()
                }
            }
            .alert(isPresented: $showScore) { () -> Alert in
                Alert(title: Text("Game finished!"), message: Text("You made a score of \(score) out of 10."), dismissButton: Alert.Button.default(Text("Start again"), action: {
                    self.reset()
                }))
            }
        }
    }

    var moveSelector: some View {
        HStack(spacing: 50) {
            ForEach (0 ..< Self.moves.count) { number in
                Button(action: {
                    self.moveChoosed(at: number)
                }) {
                    Text(self.shownMoves[number])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
