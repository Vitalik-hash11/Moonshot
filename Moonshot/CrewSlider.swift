//
//  CrewSlider.swift
//  Moonshot
//
//  Created by newbie on 24.07.2022.
//

import SwiftUI

struct CrewSlider: View {
    var crew: [MissionView.CrewMember]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Crew")
                .font(.largeTitle)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(crew, id: \.role) { member in
                        NavigationLink {
                            AstronautView(astronaut: member.astronaut)
                        } label: {
                            HStack {
                                Image(member.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                        .strokeBorder()
                                    )
                                VStack(alignment: .leading) {
                                    Text(member.astronaut.name)
                                        .font(.headline)
                                    Text(member.role)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}

struct CrewSlider_Previews: PreviewProvider {
    static var previews: some View {
        CrewSlider(crew: [MissionView.CrewMember(role: "Assistant", astronaut: Astronaut(id: "grissom", name: "grissom", description: "Mock description"))])
    }
}
