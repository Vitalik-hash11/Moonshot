//
//  ListView.swift
//  Moonshot
//
//  Created by newbie on 25.07.2022.
//

import SwiftUI

struct ListView: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    var body: some View {
        List {
            ForEach(missions, id: \.id) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 104, height: 72)
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                    .padding(.vertical)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

struct ListView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        ListView(missions: missions, astronauts: astronauts)
    }
}
