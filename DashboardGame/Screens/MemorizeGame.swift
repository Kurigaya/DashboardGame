////
////  MemorizeGame.swift
////  DashboardGame
////
////  Created by Mac-Peerapat on 24/12/2566 BE.
////
//
//import SwiftUI
//
//enum Player: String {
//    case X = "X"
//    case O = "O"
//}
//
//
//struct MemorizeGame: View {
//    @State private var board: [[Player?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
//    @State private var currentPlayer: Player = .X
//    @State private var winner: Player? = nil
//    @State private var gameOver: Bool = false
//
//    var body: some View {
//        ZStack{
//            Color("color-primary")
//                .edgesIgnoringSafeArea(.all)
//
//            VStack {
//                Text("Tic Tac Toe")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding()
//
//                //            Spacer()
//
//                Text(gameOver ? "Game Over" : "Current Player: \(currentPlayer.rawValue)")
//                    .font(.title)
//                    .padding()
//
//                ZStack{
//                    RoundedRectangle(cornerRadius: 14)
//                        .aspectRatio(1, contentMode: .fit)
//                        .foregroundColor(Color.white)
//                        .shadow(radius: 10)
//                        .padding()
//                    VStack(spacing: 5) {
//                        ForEach(0..<3, id: \.self) { row in
//                            HStack(spacing: 5) {
//                                ForEach(0..<3, id: \.self) { col in
//                                    Button(action: {
//                                        if board[row][col] == nil && winner == nil {
//                                            board[row][col] = currentPlayer
//                                            checkForWinner()
//                                            currentPlayer = (currentPlayer == .X) ? .O : .X
//                                        }
//                                    }) {
//                                        Text(board[row][col]?.rawValue ?? "")
//                                            .font(.largeTitle)
//
//                                            .frame(width: 90, height: 90)
//                                            .background(Color("color-text"))
//                                            .foregroundColor(.white)
//                                            .cornerRadius(10)
//                                    }
//                                }
//                            }
//                        }
//                    }
//
//                }
//                Button(action: {
//                    resetGame()
//                }) {
//                    Text("Reset Game")
//                        .font(.title)
//                        .padding()
//                        .background(Color.red)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//            }
//        }
//        .navigationTitle("Tic")
//    }
//
//    func checkForWinner() {
//        // Check rows
//        for row in board {
//            if row.allSatisfy({ $0 == currentPlayer }) {
//                winner = currentPlayer
//                gameOver = true
//                return
//            }
//        }
//
//        // Check columns
//        for col in 0..<3 {
//            if board[0][col] == currentPlayer && board[1][col] == currentPlayer && board[2][col] == currentPlayer {
//                winner = currentPlayer
//                gameOver = true
//                return
//            }
//        }
//
//        // Check diagonals
//        if board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer {
//            winner = currentPlayer
//            gameOver = true
//            return
//        }
//        if board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer {
//            winner = currentPlayer
//            gameOver = true
//            return
//        }
//
//        // Check for a tie (if all cells are filled)
//        if !board.flatMap({ $0 }).contains(nil) {
//            winner = .O // Set to .O to indicate a tie
//        }
//    }
//
//    func resetGame() {
//        board = Array(repeating: Array(repeating: nil, count: 3), count: 3)
//        currentPlayer = .X
//        winner = nil
//        gameOver = false
//    }
//}
//
//struct MemorizeGame_Previews: PreviewProvider {
//    static var previews: some View {
//        MemorizeGame()
//    }
//}
