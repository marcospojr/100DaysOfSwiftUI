//
//  AstronautView.swift
//  Moonshot
//
//  Created by Marcos Jr on 07/11/20.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missionsFlew: [Mission]
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        var matches: [Mission] = []
        
        for mission in missions {
            for crew in mission.crew {
                if crew.name == astronaut.id {
                    matches.append(mission)
                    break
                }
            }
        }
        self.missionsFlew = matches
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                    Text("Missions that this astronaut flew on:")
                
                    if !self.missionsFlew.isEmpty {
                        Form {
                            Section(header: Text("Mission Flew")
                                .foregroundColor(Color.blue)
                                .font(.system(.body))) {
                                    List(self.missionsFlew) { mission in
                                        Text("◉  \(mission.displayName)")
                                    }
                            }
                        }
                    }
                    
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astrounauts.json")
    static let missions: [Mission] = Bundle.main.decode("Missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
