//
//  AstronautView.swift
//  Moonshot
//
//  Created by newbie on 24.07.2022.
//

import SwiftUI

struct AstronautView: View {
    var astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 20)
                
                Text(astronaut.name)
                    .font(.largeTitle)
                    .padding(.vertical)
                Text(astronaut.description)
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts.first!.value)
    }
}
