//
//  Dashboard.swift
//  DashboardGame
//
//  Created by Mac-Peerapat on 24/12/2566 BE.
//

import SwiftUI
import Foundation
import GLKit

import Charts
import UIKit

let gameCounter = GameCount()

struct Dashboard: View {
    @ObservedObject var gameCounter: GameCount

    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    welcomeText
                    dashbord
                    Spacer()
                    
                    VStack{
                            //1st game
                        NavigationLink(destination: TicTacToeGame(gameCounter: gameCounter)){
                                gameItem(by: Image("tictactoeIcon"), text: Text("Tic Tac Toe"))
                            }

                            //2nd game
                        NavigationLink(destination: FourInRowGame(gameCounter: gameCounter)){
                                    gameItem(by: Image("fourinrowIcon"), text: Text("Four in row"))
                        }.onTapGesture {
                            gameCounter.playGame("four")
                        }
                        
                            //3rd game
                            NavigationLink(destination: MemoryGameView(viewModel: GameViewModel(), gameCounter: gameCounter)){
                                    gameItem(by: Image("memoryIcon"), text: Text("Memorize"))
                            }
                        }
                        .padding()
                        .foregroundColor(Color("color-text"))
                }
                
                
            }
            .padding(.top)
            .background(Color("color-primary").ignoresSafeArea(.all))
        }
    }
    // Title game
    var welcomeText : some View {
            VStack {
                HStack {
                    Text("Welcome To")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("color-text"))
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }

                HStack {
                    Text("Game Addicted Life!")
                        .font(.system(size: 37, weight: .semibold, design: .rounded))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("color-text"))
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
    }

    //Dashbord
    var dashbord : some View {
            VStack{
                HStack{
                    Text("Dashbord")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("color-alter"))
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal)
                HStack{
                    Text("Today : ")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("color-alter"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal)
                HStack{
                }
                showdate()
                HStack{
                    Text("Score : ")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("color-alter"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal)
                HStack{
                }
                bar_scoreTotal
                chart_score_game
                    .aspectRatio(4/3, contentMode: .fill)
                

            }
            .background(Color("color-secondary"))
            .clipShape(Rectangle())
            .cornerRadius(15)
            .padding()
        }
    //Score Total
    var bar_scoreTotal: some View {
    
            HStack{
                Text("Score Total : \(gameCounter.getTotal()) Point")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .layoutPriority(1)
                    .lineLimit(2)
                    .padding()
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .background(Color("color-tertary").opacity(0.5))
            .clipShape(Rectangle())
            .cornerRadius(15)
            .padding()
        }
    
    //Score Game
    var played1 = 1//gameCount.getCount(forGame: "tic")
    var played2 = 30
    var played3 = 30


    //data dianary score

//    struct ValuePerCategory{
//        var Category: String
//        var value: Int
//    }

//    let data: [ValuePerCategory] = [
//        .init(Category: "Tic Tac Toe", value: gameCounter.getCount(forGame: "tic")),
//        .init(Category: "4 in Row", value: 2),
//        .init(Category: "Memorize", value: 3)
//    ]
    

    //Score Game
    var chart_score_game: some View {
        
        //            Chart(data, id: \.Category){ item in
        //                BarMark(
        //                    x: .value("game", item.Category),
        //                    y: .value("score", item.value)
        //                )
        //                .foregroundStyle(Color("color-primary").opacity(0.8))
        //            }
        //            .background(Color("color-tertary").opacity(0.5))
        //            .clipShape(Rectangle())
        //            .cornerRadius(15)
        //            .padding()
        
        Chart {
            if #available(iOS 17.0, *) {
                ForEach(Array(gameCounter.gameCounts), id: \.key) { game, value in
                    SectorMark(
                        angle: .value("Played", Double(value)),
                        angularInset: 2.0
                    )
                    .foregroundStyle(by: .value("Game", game))
                }
            }
        }
    }
}


// Date time
struct showdate : View {
    var body: some View{
        HStack{
            Text(Date().displayFormat)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .layoutPriority(1)
                .lineLimit(2)
                .padding()
            // left space
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
//        .padding(.horizontal)
        .background(Color("color-tertary").opacity(0.5))
        .clipShape(Rectangle())
        .cornerRadius(15)
        .padding()
    }
}

extension Date {
    var displayFormat: String{
        self.formatted(
            .dateTime
                .year()
                .month(.wide)
                .day(.twoDigits)
                .day()
            )
    }
}
func gameItem(by image: Image, text: Text)-> some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 20)
            Group{
                base.foregroundColor(Color("color-secondary"))
                base.strokeBorder(lineWidth: 2)
                
                HStack{
                    image
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                    Spacer()
                    text
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }


struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard(gameCounter: GameCount())
    }
}
