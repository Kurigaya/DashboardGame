//
//  ContentView.swift
//  DashboardGame
//
//  Created by Mac-Peerapat on 22/12/2566 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Dashboard(gameCounter: gameCounter)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
