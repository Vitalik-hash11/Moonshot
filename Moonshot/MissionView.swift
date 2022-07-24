//
//  MissionView.swift
//  Moonshot
//
//  Created by newbie on 23.07.2022.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Divider()
                        Text("Mission Highlights")
                            .font(.title.bold())
                        
                        Text("Launch date: \(mission.formattedLaunchDate)")
                            .font(.headline)
                            .padding(.vertical)
                        
                        Text(mission.description)
                        Divider()
                    }
                    .padding(.horizontal)
                    
                    CrewSlider(crew: crew)
                }
                .foregroundColor(.white)
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map({ crewMember in
            if let astronaut = astronauts[crewMember.name] {
                return CrewMember(role: crewMember.role ?? "N/A", astronaut: astronaut)
            } else {
                fatalError("Cannot find an astrounaut \(crewMember.name)")
            }
        })
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        Group {
            MissionView(mission: missions.first!, astronauts: astronauts)
        }
    }
}
