//
//  ContentView.swift
//  Moonshot
//
//  Created by Marcos Jr on 05/11/20.
//

import SwiftUI

struct ContentView: View {
    enum DataSelection {
        case launchDate
        case crewNames
    }
    
    let astronaunts:[Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State var dataSelection: DataSelection
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: self.missionView(mission: mission)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit() //Shortcut to aspectRatio
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName).font(.headline)
                        if self.dataSelection == .launchDate {
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }
            .navigationBarItems(trailing: self.selectionBarButton())
            .navigationBarTitle("Moonshoot")
        }
    }
    
    func missionView(mission: Mission) -> MissionView {
        if dataSelection == .crewNames {
            return MissionView(missions: self.missions, mission: mission, astronauts: self.astronaunts)
        }
        return MissionView(missions: self.missions, mission: mission, astronauts: [])
    }
    
    func selectionBarButton() -> Button<Text> {
        if self.dataSelection == .launchDate {
            return
                Button("As Launch Date") {
                    self.dataSelection = .crewNames
            }
        } else {
            return Button("As Crew Members") {
                self.dataSelection = .launchDate
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dataSelection: .launchDate)
    }
}
