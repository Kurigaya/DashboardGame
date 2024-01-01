//
//  ContentView.swift
//  My Project
//
//  Created by saruttaya attramongkol on 20/12/2566 BE.
//

import SwiftUI

import Foundation
import GLKit

import Charts
import UIKit

struct Dashboard2: View {
    
    @ObservedObject var gameCount: GameCount
    //    @State var gameCount = ["tic":0, "four":0, "mem":0]
    //    var gameCount = GameCount()
    //    mutating func addCount(_ game: String){
    //        gameCount[game]! += 1
    //    }
    var body: some View {
        NavigationView{
            //            ScrollView{
            //                VStack{
            //                    welcomeText
            //                    dashbord
            //
            //                    Spacer(minLength: 0)
            //
            //                    //CustomTabBar()
            //
            //                    //            CustomTabBar(selectedTab: $selectedTab)
            //                    Button(action: {
            //                        gameCount.playGame("tic")
            //                    }, label: {
            //                        Text("Tic \(gameCount.getTotal())")
            //                    })
            //                    Text("\(gameCount.getCount(forGame: "tic"))")
            //                    Games()
            //                        .padding()
            //                        .foregroundColor(Color("color-text"))
            //                }
            //
            //
            //            }
            //            .padding(.top)
            //            .background(Color("color-primary").ignoresSafeArea(.all))
        }
    }
    
    //    // Title game
    //    var welcomeText : some View {
    //            VStack {
    //                HStack {
    //                    Text("Welcome To")
    //                        .font(.title)
    //                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    //                        .foregroundColor(Color("color-text"))
    //                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
    //                }
    //
    //                HStack {
    //                    Text("Game Addicted Life!")
    //                        .font(.system(size: 37, weight: .semibold, design: .rounded))
    //                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    //                        .foregroundColor(Color("color-text"))
    //                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
    //                }
    //            }
    //            .padding()
    //    }
    //
    //    //Dashbord
    //    var dashbord : some View {
    //            VStack{
    //                HStack{
    //                    Text("Dashbord")
    //                        .font(.title)
    //                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    //                        .foregroundColor(Color("color-alter"))
    //                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
    //                }
    //                .padding(.horizontal)
    //                HStack{
    //                    Text("Today : ")
    //                        .font(.system(size: 20, weight: .semibold, design: .rounded))
    //                        .foregroundColor(Color("color-alter"))
    //                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    //                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
    //                }
    //                .padding(.horizontal)
    //                HStack{
    //                }
    //                showdate()
    //                HStack{
    //                    Text("Score : ")
    //                        .font(.system(size: 20, weight: .semibold, design: .rounded))
    //                        .foregroundColor(Color("color-alter"))
    //                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
    //                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
    //                }
    //                .padding(.horizontal)
    //                HStack{
    //                }
    //                bar_scoreTotal
    //                chart_score_game
    //                    .aspectRatio(4/3, contentMode: .fill)
    //
    //
    //            }
    //            .background(Color("color-secondary"))
    //            .clipShape(Rectangle())
    //            .cornerRadius(15)
    //            .padding()
    //        }
    //    //Score Total
    //    var bar_scoreTotal: some View {
    //
    //            HStack{
    //                Text("Score Total : \(gameCount.getTotal()) Point")
    //                    .font(.system(size: 20, weight: .semibold, design: .rounded))
    //                    .foregroundColor(.white)
    //                    .layoutPriority(1)
    //                    .lineLimit(2)
    //                    .padding()
    //                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
    //            }
    //            .background(Color("color-tertary").opacity(0.5))
    //            .clipShape(Rectangle())
    //            .cornerRadius(15)
    //            .padding()
    //        }
    //
    //    //Score Game
    //    var played1 = 1//gameCount.getCount(forGame: "tic")
    //    var played2 = 30
    //    var played3 = 30
    //
    //
    //    //data dianary score
    //
    //    struct ValuePerCategory{
    //        var Category: String
    //        var value: Int
    //    }
    //
    //    let data: [ValuePerCategory] = [
    //        .init(Category: "Game 1", value: 1),
    //        .init(Category: "Game 2", value: 2),
    //        .init(Category: "Game 3", value: 3)
    //    ]
    //
    //
    //    //Score Game
    //    var chart_score_game: some View {
    //
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
    //
    //        }
    //}
    //
    //struct Dashboard2_Previews: PreviewProvider{
    //    static var previews: some View{
    //        Dashboard2(gameCount: gameCounter)
    //    }
    //}
    //
    //
    //
    //// Date time
    //struct showdate : View {
    //    var body: some View{
    //        HStack{
    //            Text(Date().displayFormat)
    //                .font(.system(size: 20, weight: .semibold, design: .rounded))
    //                .foregroundColor(.white)
    //                .layoutPriority(1)
    //                .lineLimit(2)
    //                .padding()
    //            // left space
    //            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
    //        }
    ////        .padding(.horizontal)
    //        .background(Color("color-tertary").opacity(0.5))
    //        .clipShape(Rectangle())
    //        .cornerRadius(15)
    //        .padding()
    //    }
    //}
    //
    //extension Date {
    //    var displayFormat: String{
    //        self.formatted(
    //            .dateTime
    //                .year()
    //                .month(.wide)
    //                .day(.twoDigits)
    //                .day()
    //            )
    //    }
    //}
    //
}
