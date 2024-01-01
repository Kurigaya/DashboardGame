//
//  MemoryGameView.swift
//  DashboardGame
//
//  Created by Mac-Peerapat on 25/12/2566 BE.
//

import SwiftUI

var halloween = ["👻", "🎃", "🕷️", "👹", "🕸️", "🧙", "👿", "😱","👻", "🎃", "🕷️", "👹", "🕸️", "🧙", "👿", "😱"].shuffled() //for random

var animals = ["🐶", "🐱", "🐹","🦊","🐻","🐼","🐮","🐷","🐶", "🐱", "🐹","🦊","🐻","🐼","🐮","🐷"].shuffled()

var vehicles = ["🚗","🚌","🚓","🚑","🚜","✈️","🚀","🛸","🚗","🚌","🚓","🚑","🚜","✈️","🚀","🛸"].shuffled()


// like a class >> empathize to fn
// most will be 1 obj. in 1 struct
struct MemoryGameView: View { // View is interface or protocol
    @ObservedObject var viewModel: GameViewModel
    @ObservedObject var gameCounter: GameCount
    @State private var isGameWon: Bool = false {
        didSet {
            if isGameWon {
                gameCounter.playGame("mem")
            }
        }
    }
    @State var cardCount = 16 // @State mutable var
    @State var currentTheme = halloween
    var halloweenIcon = ["pumpkinIcon_not", "pumpkinIcon_selected"]
    var animalIcon = ["cat_not", "cat_selected"]
    var vehicleIcon = ["plane_not", "plane_selected"]
    
    var body: some View { // Computed variable // Realtime render
        ZStack{
            Color("color-primary")
                .ignoresSafeArea(.all)
            VStack{
                Spacer()
                gameName
                Spacer()
                cards
                    .animation(.default, value: viewModel.cards)
                Divider()
                Spacer()
                themeBar
                Spacer()
                
            }
            .padding()
            .sheet(isPresented: $isGameWon) {
                VStack{
                    Text("Game Over!")
                        .font(.largeTitle)
                        .padding()
                    Button("New Game"){
                        viewModel.restart()
                        isGameWon = false
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
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10){
            createCards()
        }
    }
    
    func createCards() -> some View{
            
            //emojis.indicies == 0..<emojis.count
        ForEach(viewModel.cards){ card in //give index as paramiter into loop
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                        isGameWon = viewModel.checkWin()
                    }
            }
        .foregroundColor(.orange) //card color
    }
    
    func themeChanger(by theme: Array<String>, icon:Array<String>, themeName:String) -> some View {
        VStack{
            // icon
            Image(currentTheme == theme ? icon[1] : icon[0])
            // label
            Text(themeName)
        }
        .onTapGesture {
            if currentTheme == theme{
                return
            }
            else{
                currentTheme = theme
                //shuffleCard(by: theme)
            }
            // TODO >> Shuffle everytime that theme are changed
        }
    }
    var themeBar: some View {
        HStack(spacing: 20){
            //theme1
            themeChanger(by: halloween, icon: halloweenIcon, themeName: "Halloween")
            
//            //theme2
//            themeChanger(by: animals, icon: animalIcon, themeName: "Animal")
//            
//            //theme3
//            themeChanger(by: vehicles, icon: vehicleIcon, themeName: "Vehicle")
            
        }
    }
  
    var gameName: some View {
        Text("Memorize").foregroundColor(.blue)
            .font(.system(.largeTitle, design: .rounded))
            .bold()
    }
}

struct CardView: View {
    let card: MemoryGameModel<String>.Card
    
    var body: some View{
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.largeTitle)
            }.opacity(card.isFaceUp ? 1 : 0)
            base.opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct MemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: GameViewModel(), gameCounter:GameCount())
    }
}
    //All cards faced up >> Game over >> reset game
    //Paired cards >> hold that paired faced up
    //Not match pair >> face that pair down
