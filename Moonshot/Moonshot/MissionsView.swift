//
//  MissionsView.swift
//  Moonshot
//
//  Created by Thomas Durand on 09/02/2020.
//  Copyright © 2020 Thomas Durand. All rights reserved.
//

import SwiftUI

struct MissionsView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct MissionsView_Previews: PreviewProvider {
    static var previews: some View {
        MissionsView()
    }
}
