//
//  ContentView.swift
//  Moonshot
//
//  Created by newbie on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isGrid = true
    
    var body: some View {
        NavigationView {
            VStack {
                if isGrid {
                    // grid view
                    GridView(missions: missions, astronauts: astronauts)
                } else {
                    // list view
                    ListView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Toggle("", isOn: $isGrid)
                    .toggleStyle(SwitchToggleStyle(tint: .green))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
