//
//  FourInRowGame.swift
//  DashboardGame
//
//  Created by Mac-Peerapat on 24/12/2566 BE.
//

import SwiftUI

enum Players: String {
    case red = "Red"
    case yellow = "Yellow"
}

struct FourInRowGame: View {
    @ObservedObject var gameCounter: GameCount
    @State private var board: [[Players?]] = Array(repeating: Array(repeating: nil, count: 7), count: 6)
    @State private var currentPlayer: Players = .red
    @State private var winner: Players? = nil
    @State private var isGameDraw: Bool = false
    @State var gameOver: Bool  = false
    

    var body: some View {
        NavigationView{
            ZStack{
                Color("color-primary")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Four in a row").foregroundColor(.blue)
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .padding()
                    
                    Text(winner != nil ? "\(winner!.rawValue) wins!" : (isGameDraw ? "It's a draw!" : "Current Player: \(currentPlayer.rawValue)"))
                        .font(.title2)
                        .foregroundStyle(Color("color-text"))
                        .bold()
                        .padding()
                    
                    gridBoard
//                    Grid(board: $board, currentPlayer: $currentPlayer, winner: $winner, isGameDraw: $isGameDraw, gameOver: $gameOver)
                }
            }
            .sheet(isPresented: $gameOver) {
                VStack{
                    Text("Game Over!")
                        .font(.largeTitle)
                        .padding()
                    Text(winner != nil ? "\(winner!.rawValue) wins!" : (isGameDraw ? "It's a draw!" : "Current Player: \(currentPlayer.rawValue)"))
                        .font(.title)
                        .padding()
                    Button("New Game"){
                        resetGame()
                    }
                    .font(.title2)
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                }
            }
        }
    }
    
    var gridBoard: some View{
        VStack {
            ForEach(0..<6, id: \.self) { row in
                HStack {
                    ForEach(0..<7, id: \.self) { col in
                        Circle()
                            .frame(width: 45, height: 45)
                            .foregroundColor(board[row][col] == .red ? .red : (board[row][col] == .yellow ? .yellow : .white))
                            .onTapGesture {
                                if board[row][col] == nil && winner == nil {
                                    dropPiece(at: col)
                                }
                            }
                    }
                }
            }
        }
        .padding()
        .background(Color.blue)
        .shadow(radius: 10)
    }
    
    func dropPiece(at column: Int) {
        for row in (0..<6).reversed() {
            if board[row][column] == nil {
                board[row][column] = currentPlayer
                checkForWinner()
                if winner == nil {
                    currentPlayer = (currentPlayer == .red) ? .yellow : .red
                }
                return
            }
        }
        // If the column is full, mark it as a draw
        if !board[0].contains(nil) {
            isGameDraw = true
        }
    }

    // Check for a win condition
    func checkForWinner() {
        // Check for Player1's win
        if checkForWin(for: .red) {
            gameOver = true
            gameCounter.playGame("four")
            winner = .red
            return
        }
        
        // Check for Player2's win
        if checkForWin(for: .yellow) {
            gameOver = true
            gameCounter.playGame("four")
            winner = .yellow
            return
        }
        
        // Check for a draw
        if isBoardFull() {
            gameOver = true
            isGameDraw = true
            gameCounter.playGame("four")
        }
    }

    // Check for a win condition for a specific player
    func checkForWin(for player: Players) -> Bool {
        // Check horizontally
        for row in 0..<6 {
            for col in 0..<4 {
                if board[row][col] == player && board[row][col + 1] == player && board[row][col + 2] == player && board[row][col + 3] == player {
                    return true
                }
            }
        }

        // Check vertically
        for row in 0..<3 {
            for col in 0..<7 {
                if board[row][col] == player && board[row + 1][col] == player && board[row + 2][col] == player && board[row + 3][col] == player {
                    return true
                }
            }
        }

        // Check diagonally (from bottom-left to top-right)
        for row in 0..<3 {
            for col in 0..<4 {
                if board[row][col] == player && board[row + 1][col + 1] == player && board[row + 2][col + 2] == player && board[row + 3][col + 3] == player {
                    return true
                }
            }
        }

        // Check diagonally (from bottom-right to top-left)
        for row in 0..<3 {
            for col in 3..<7 {
                if board[row][col] == player && board[row + 1][col - 1] == player && board[row + 2][col - 2] == player && board[row + 3][col - 3] == player {
                    return true
                }
            }
        }

        return false
    }

    // Check if the board is full (a draw)
    func isBoardFull() -> Bool {
        for row in 0..<6 {
            for col in 0..<7 {
                if board[row][col] == nil {
                    return false
                }
            }
        }
        return true
    }

    func resetGame() {
        board = Array(repeating: Array(repeating: nil, count: 7), count: 6)
        currentPlayer = .red
        winner = nil
        isGameDraw = false
        gameOver = false
    }
}

struct FourInRowGame_Previews: PreviewProvider {
    static var previews: some View {
        FourInRowGame(gameCounter: gameCounter)
    }
}
