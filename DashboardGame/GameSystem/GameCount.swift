//
//  GameCount.swift
//  DashboardGame
//
//  Created by Mac-Peerapat on 1/1/2567 BE.
//

import Foundation
import SwiftUI

class GameCount: ObservableObject {
    @Published var gameCounts = ["tic":0, "four":0, "mem":0]
    func initializeGame(_ game: String) {
        gameCounts[game] = 0
    }

    func playGame(_ game: String) {
        gameCounts[game, default: 0] += 1
        print("Game ADD!")
//        if var count = gameCounts[game] {
//            count += 1
//            gameCounts[game] = count
//        } else {
//            print("Game '\(game)' hasn't been initialized.")
//        }
    }

    func getCount(forGame game: String) -> Int {
        return gameCounts[game] ?? 0
    }
    
    func getTotal() -> Int{
        return ((gameCounts["tic"] ?? 0) + (gameCounts["four"] ?? 0) + (gameCounts["mem"] ?? 0))
    }
}
