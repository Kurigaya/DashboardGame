//
//  TicTacToeGame.swift
//  DashboardGame
//
//  Created by Mac-Peerapat on 24/12/2566 BE.
//

import Foundation

class TicTacToeGame {
    enum Player: String {
        case O = "O"
        case X = "X"
       
    }
    
    //Set can be read but not manipulated
    private(set) var winningSignal: [Int]?
    private (set)var board: [Player?]
    private(set) var currentPlayer: Player

    
    init() {
        board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
        currentPlayer = .O
    }

    func getCurrentPlayer() -> Player {
        return currentPlayer
    }
    
    func getAvailableMoves() -> [Int] {
        var availableMoves: [Int] = []
        
        for (index, player) in board.enumerated() {
            if player == nil {
                availableMoves.append(index)
            }
        }
        
        return availableMoves
    }
    
    func makeMove(at index: Int) -> Bool {
        if index < 0 || index >= board.count || board[index] != nil {
            //No more moves
            return false
        }

        board[index] = currentPlayer
        currentPlayer = (currentPlayer == .X) ? .O : .X
        return true
        
        }
    
    func checkForWin() -> Player? {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], //rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], //columns
            [0, 4, 8], [2, 4, 6]             //diagonals
        ]
        

        for pattern in winPatterns {
            let a = pattern[0]
            let b = pattern[1]
            let c = pattern[2]

            if let playerA = board[a], let playerB = board[b], let playerC = board[c], playerA == playerB, playerB == playerC {
                
                //For the highlight
                winningSignal = pattern
                return playerA
            }
        }

        //No win yet
        return nil
    }


    func isBoardFull() -> Bool {
        return !board.contains(nil)
    }
}
