//
//  GameViewModel.swift
//  DashboardGame
//
//  Created by Mac-Peerapat on 25/12/2566 BE.
//

import SwiftUI

class GameViewModel : ObservableObject{
    // Make static variable for use anywhere any life-cycle
    static var halloween = ["👻", "🎃", "🕷️", "👹", "🕸️", "🧙", "👿", "😱","🫥","👾", "🤡", "💀"]
    static let animals = ["🐶", "🐱", "🐹","🦊","🐻","🐼","🐮","🐷","🐶", "🐱", "🐹","🦊","🐻","🐼","🐮","🐷"]
    static let vehicles = ["🚗","🚌","🚓","🚑","🚜","✈️","🚀","🛸","🚗","🚌","🚓","🚑","🚜","✈️","🚀","🛸"]
    var i = 0
    @Published private var model: MemoryGameModel<String> = createModel()
    
    var cards: [MemoryGameModel<String>.Card] { return model.cards } // Computed variable
    
    static func createModel() -> MemoryGameModel<String> {
        let emojis = halloween.shuffled()
        var model = MemoryGameModel<String>(numberOfPairs: 8, contentFactory: {(index) in emojis[index]})
        model.shuffle()
        return model
    }
    
    func choose(_ card:MemoryGameModel<String>.Card){
        model.choose(card)
        // Check for matches after the user chooses a card
            if model.cards.filter({ $0.isFaceUp && !$0.isMatched }).count == 2 {
                checkForMatches()
            }
            // Check for the win condition
            if model.cards.allSatisfy({ $0.isMatched }) {
                // The game is won
                print("Game won!")
            }
    }
    
    private func checkForMatches() {
            // Get the two face-up cards
            let faceUpCards = model.cards.filter { $0.isFaceUp && !$0.isMatched }

            // Check if they have the same content
            if faceUpCards.count == 2 && faceUpCards[0].content == faceUpCards[1].content {
                // Cards match, mark them as matched
                model.markMatched(for: faceUpCards[0])
                model.markMatched(for: faceUpCards[1])
            } else {
                // Cards do not match, flip them face-down
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                    self.model.flipFaceDown(for: faceUpCards[0])
                    self.model.flipFaceDown(for: faceUpCards[1])
                }
            }
        }
    
//    var isGameWon: Bool{
//        return model.checkWin()
//    }
    func checkWin() -> Bool{
        return model.checkWin()
    }
    
    func restart(){
        model = GameViewModel.createModel()
    }
    
}
